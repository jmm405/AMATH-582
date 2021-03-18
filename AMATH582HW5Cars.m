vidObj = VideoReader('monte_carlo_low.mp4');

video = read(vidObj);
numFrames = get(vidObj, 'NumFrames');
height = get(vidObj, 'Height');
width = get(vidObj, 'Width');

for j=1:numFrames
    vid_mat(:,j) = double(reshape(rgb2gray(video(:,:,:,j)), [], 1));
end

X1 = vid_mat(:,1:end-1);
X2 = vid_mat(:,2:end);
[U, S, V] = svd(X1, 'econ');
lambda1 = diag(S);
plot(lambda1, 'o')
title("Energy Captured by Each Singular Value")
xlabel("Singular Values")
ylabel("Energy")

r = 26;
t = linspace(0,numFrames, 2*numFrames);
dt = t(2) - t(1);

[Phi,omega,lambda,b,X_dmd,S] = my_dmd(X1,X2,r,dt);

% % % -- Watch Movie Background
 for j=1:numFrames - 1
 frame = reshape(X_dmd(:,j), height, width);
 frame = uint8(real(frame));
 imshow(frame); drawnow
 end
 
 % -- Watch Movie Foreground
 foreground = X1 - X_dmd;
 for j=1:numFrames - 1
 frame = reshape(-foreground(:,j), height, width);
 frame = uint8(real(frame));
 imshow(frame); drawnow
 end
%% Function
function [Phi,omega,lambda,b,X_dmd,S] = my_dmd(X1,X2,r,dt)
[U, S, V] = svd(X1, 'econ');
 % Minimum between r and the number of columns in U
r = min(r, size(U,2));
% Truncate SVD results to low rank
U_r = U(:, 1:r);
S_r = S(1:r, 1:r);
V_r = V(:, 1:r);
% Calculate A tilde and its eigenvector & eigenvalue
A_tilde = U_r' * X2 * V_r / S_r;
[W_r, D] = eig(A_tilde);
Phi = X2 * V_r / S_r * W_r;
lambda = diag(D);
omega = log(lambda)/dt;
% Compute DMD mode amplitudes
x1 =X1(:, 1);
b = Phi\x1;
% DMD reconstruction
measurements_1 = size(X1, 2);
time_dynamics = zeros(r, measurements_1);
t = (0:measurements_1 - 1).*dt;
for i = 1:measurements_1
    time_dynamics(:, i) = (b.*exp(omega*t(i)));
end
X_dmd = Phi * time_dynamics;
end