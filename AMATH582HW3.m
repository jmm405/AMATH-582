clear all; close all; clc;
load cam1_1.mat; load cam2_1.mat; load cam3_1.mat;

[height1 width1 rgb1 num_frames1] = size(vidFrames1_1);
[height2 width2 rgb2 num_frames2] = size(vidFrames2_1);
[height3 width3 rgb3 num_frames3] = size(vidFrames3_1);

vid1_1 = vidFrames1_1(225:400,300:400,:,:);
vid2_1 = vidFrames2_1(100:350,225:375,:,12:237);
vid3_1 = vidFrames3_1(250:350,275:500,:,1:226);

% % % -- Watch Movie
% for j=1:225
% X= vid1_1(:,:,:,j);
% Y = vid2_1(:,:,:,j);
% Z = vid3_1(:,:,:,j);
% subplot(3,1,1), imshow(X); drawnow; 
% subplot(3,1,2), imshow(Y); drawnow; 
% subplot(3,1,3), imshow(Z); drawnow; 
% end

X1 = []; Y1 = []; X2 = []; Y2 = []; X3 = []; Y3 = [];

for k = 1:226
    cam1 = rgb2gray(vid1_1(:,:,:,k));
    [max1, idx1] = max(cam1(:));
    [x1, y1] = ind2sub(size(cam1),idx1);
    X1 = [X1, x1]; Y1 = [Y1, y1];
    
    cam2 = rgb2gray(vid2_1(:,:,:,k));
    [max2, idx2] = max(cam2(:));
    [x2, y2] = ind2sub(size(cam2),idx2);
    X2 = [X2, x2]; Y2 = [Y2, y2];
    
    cam3 = rgb2gray(vid3_1(:,:,:,k));
    [max3, idx3] = max(cam3(:));
    [x3, y3] = ind2sub(size(cam3),idx3);
    X3 = [X3, x3]; Y3 = [Y3, y3];
end

mat1 = [X1; Y1; X2; Y2; X3; Y3];
[m1,n1] = size(mat1);
avg1 = mean(mat1,2);
mat1 = mat1-repmat(avg1,1,n1);

[U1,S1,V1] = svd(mat1'/sqrt(n1-1));
lambda1 = diag(S1).^2;
sumlam1 = sum(lambda1);
percent1 = lambda1/sumlam1;
PCA1 = U1*mat1';
approx = U1(:,1)*S1(1,1)*V1(:,1)';

figure(1)
subplot(1,2,1), plot(percent1, 'O'), set(gca, 'Fontsize', 12)
title("Test 1: Energy Captured by Each Singular Value")
xlabel("Singular Values")
ylabel("Energy (%)")

subplot(1,2,2), hold on, plot(approx), set(gca, 'Fontsize', 12)
title("Test 1: Position of Paint Can vs Time")
xlabel("Time (Frame)")
ylabel("Position")



load cam1_2.mat; load cam2_2.mat; load cam3_2.mat;

[height1_2 width1_2 rgb1_2 num_frames1_2] = size(vidFrames1_2);
[height2_2 width2_2 rgb2_2 num_frames2_2] = size(vidFrames2_2);
[height3_2 width3_2 rgb3_2 num_frames3_2] = size(vidFrames3_2);

vid1_2 = vidFrames1_2(225:400,325:475,:,5:314);
vid2_2 = vidFrames2_2(75:375,200:400,:,27:336);
vid3_2 = vidFrames3_2(225:325,275:500,:,9:318);


[~,~,~,t1_2] = size(vid1_2);
[~,~,~,t2_2] = size(vid2_2);
[~,~,~,t3_2] = size(vid3_2);

% % -- Watch Movie
% for j=1:310
% X= vid1_2(:,:,:,j);
% Y = vid2_2(:,:,:,j);
% Z = vid3_2(:,:,:,j);
% subplot(3,1,1), imshow(X); drawnow; 
% subplot(3,1,2), imshow(Y); drawnow; 
% subplot(3,1,3), imshow(Z); drawnow; 
% end

X1_2 = []; Y1_2 = []; X2_2 = []; Y2_2 = []; X3_2 = []; Y3_2 = [];

for k = 1:310
    cam1_2 = rgb2gray(vid1_2(:,:,:,k));
    [max1_2, idx1_2] = max(cam1_2(:));
    [y1_2, x1_2] = ind2sub(size(cam1_2),idx1_2);
    X1_2 = [X1_2, x1_2]; Y1_2 = [Y1_2, y1_2];
    
    cam2_2 = rgb2gray(vid2_2(:,:,:,k));
    [max2_2, idx2_2] = max(cam2_2(:));
    [y2_2, x2_2] = ind2sub(size(cam2_2),idx2_2);
    X2_2 = [X2_2, x2_2]; Y2_2 = [Y2_2, y2_2];
    
    cam3_2 = rgb2gray(vid3_2(:,:,:,k));
    [max3_2, idx3_2] = max(cam3_2(:));
    [y3_2, x3_2] = ind2sub(size(cam3_2),idx3_2);
    X3_2 = [X3_2, x3_2]; Y3_2 = [Y3_2, y3_2];
end

mat2 = [X1_2; Y1_2; X2_2; Y2_2; X3_2; Y3_2];
[m2,n2] = size(mat2);
avg2 = mean(mat2,2);
mat2 = mat2-repmat(avg2,1,n2);

[U2,S2,V2] = svd(mat2'/sqrt(n2-1));
lambda2 = diag(S2).^2;
sumlam2 = sum(lambda2);
percent2 = lambda2/sumlam2;
PCA2 = U2*mat2';

figure(2)
subplot(1,2,1), plot(percent2, 'O'), set(gca, 'Fontsize', 14)
title("Test 2: Energy Captured by Each Singular Value")
xlabel("Singular Values")
ylabel("Energy (%)")

subplot(3,2,2), plot(U2(:,1)), set(gca, 'Fontsize', 14)
title("Test 2: Position of Paint Can - First Mode")
xlabel("Time (Frame)")
ylabel("Position")
subplot(3,2,4), plot(U2(:,2)), set(gca, 'Fontsize', 14)
title("Test 2: Position of Paint Can - Second Mode")
xlabel("Time (Frame)")
ylabel("Position")
subplot(3,2,6), plot(U2(:,3)), set(gca, 'Fontsize', 14)
title("Test 2: Position of Paint Can - Third Mode")
xlabel("Time (Frame)")
ylabel("Position")

load cam1_3.mat; load cam2_3.mat; load cam3_3.mat;

[height1_3 width1_3 rgb1_3 num_frames1_3] = size(vidFrames1_3);
[height2_3 width2_3 rgb2_3 num_frames2_3] = size(vidFrames2_3);
[height3_3 width3_3 rgb3_3 num_frames3_3] = size(vidFrames3_3);

vid1_3 = vidFrames1_3(225:400,275:400,:,8:239);
vid2_3 = vidFrames2_3(100:350,200:400,:,34:265);
vid3_3 = vidFrames3_3(225:325,275:450,:,1:232);


[~,~,~,t1_3] = size(vid1_3);
[~,~,~,t2_3] = size(vid2_3);
[~,~,~,t3_3] = size(vid3_3);

% % -- Watch Movie
% for j=1:232
% X= vid1_3(:,:,:,j);
% Y = vid2_3(:,:,:,j);
% Z = vid3_3(:,:,:,j);
% subplot(3,1,1), imshow(X); drawnow;
% subplot(3,1,2),imshow(Y); drawnow; 
% subplot(3,1,3), 
% imshow(Z); drawnow;
% end

X1_3 = []; Y1_3 = []; X2_3 = []; Y2_3 = []; X3_3 = []; Y3_3 = [];

for k = 1:232
    cam1_3 = rgb2gray(vid1_3(:,:,:,k));
    [max1_3, idx1_3] = max(cam1_3(:));
    [y1_3, x1_3] = ind2sub(size(cam1_3),idx1_3);
    X1_3 = [X1_3, x1_3]; Y1_3 = [Y1_3, y1_3];
    
    cam2_3 = rgb2gray(vid2_3(:,:,:,k));
    [max2_3, idx2_3] = max(cam2_3(:));
    [y2_3, x2_3] = ind2sub(size(cam2_3),idx2_3);
    X2_3 = [X2_3, x2_3]; Y2_3 = [Y2_3, y2_3];
    
    cam3_3 = rgb2gray(vid3_3(:,:,:,k));
    [max3_3, idx3_3] = max(cam3_3(:));
    [y3_3, x3_3] = ind2sub(size(cam3_3),idx3_3);
    X3_3 = [X3_3, x3_3]; Y3_3 = [Y3_3, y3_3];
end

mat3 = [X1_3; Y1_3; X2_3; Y2_3; X3_3; Y3_3];
[m3,n3] = size(mat3);
avg3 = mean(mat3,2);
mat3 = mat3-repmat(avg3,1,n3);

[U3,S3,V3] = svd(mat3'/sqrt(n3-1));
lambda3 = diag(S3).^2;
lambda3 = diag(S3).^2;
sumlam3 = sum(lambda3);
percent3 = lambda3/sumlam3;
PCA3 = U3*mat3';

figure(3)
subplot(1,2,1), plot(percent3, 'O'), set(gca, 'Fontsize', 14)
title("Test 3: Energy Captured by Each Singular Value")
xlabel("Singular Values")
ylabel("Energy (%)")

subplot(3,2,2), plot(U3(:,1)), set(gca, 'Fontsize', 14)
title("Test 3: Position of Paint Can - First Mode")
xlabel("Time (Frame)")
ylabel("Position")
subplot(3,2,4), plot(U3(:,2)), set(gca, 'Fontsize', 14)
title("Test 3: Position of Paint Can - Second Mode")
xlabel("Time (Frame)")
ylabel("Position")
subplot(3,2,6), plot(U3(:,3)), set(gca, 'Fontsize', 14)
title("Test 3: Position of Paint Can - Third Mode")
xlabel("Time (Frame)")
ylabel("Position")

load cam1_4.mat; load cam2_4.mat; load cam3_4.mat;

[height1_4 width1_4 rgb1_4 num_frames1_4] = size(vidFrames1_4);
[height2_4 width2_4 rgb2_4 num_frames2_4] = size(vidFrames2_4);
[height3_4 width3_4 rgb3_4 num_frames3_4] = size(vidFrames3_4);

vid1_4 = vidFrames1_4(225:400,275:450,:,1:388);
vid2_4 = vidFrames2_4(75:375,200:400,:,9:396);
vid3_4 = vidFrames3_4(150:275,275:500,:,2:389);


[~,~,~,t1_4] = size(vid1_4);
[~,~,~,t2_4] = size(vid2_4);
[~,~,~,t3_4] = size(vid3_4);

% % % -- Watch Movie
%  for j=1:387
%  X= vid1_4(:,:,:,j);
%  Y = vid2_4(:,:,:,j);
%  Z = vid3_4(:,:,:,j);
% subplot(3,1,1), imshow(X); drawnow; 
%  subplot(3,1,2),imshow(Y); drawnow;
%  subplot(3,1,3), 
% imshow(Z); drawnow;
%   end

X1_4 = []; Y1_4 = []; X2_4 = []; Y2_4 = []; X3_4 = []; Y3_4 = [];

for k = 1:388
    cam1_4 = rgb2gray(vid1_4(:,:,:,k));
    [max1_4, idx1_4] = max(cam1_4(:));
    [y1_4, x1_4] = ind2sub(size(cam1_4),idx1_4);
    X1_4 = [X1_4, x1_4]; Y1_4 = [Y1_4, y1_4];
    
    cam2_4 = rgb2gray(vid2_4(:,:,:,k));
    [max2_4, idx2_4] = max(cam2_4(:));
    [y2_4, x2_4] = ind2sub(size(cam2_4),idx2_4);
    X2_4 = [X2_4, x2_4]; Y2_4 = [Y2_4, y2_4];
    
    cam3_4 = rgb2gray(vid3_4(:,:,:,k));
    [max3_4, idx3_4] = max(cam3_4(:));
    [y3_4, x3_4] = ind2sub(size(cam3_4),idx3_4);
    X3_4 = [X3_4, x3_4]; Y3_4 = [Y3_4, y3_4];
end

mat4 = [X1_4; Y1_4; X2_4; Y2_4; X3_4; Y3_4];
[m4,n4] = size(mat4);
avg4 = mean(mat4,2);
mat4 = mat4-repmat(avg4,1,n4);

[U4,S4,V4] = svd(mat4'/sqrt(n4-1));
lambda4 = diag(S4).^2;
sumlam4 = sum(lambda4);
percent4 = lambda4/sumlam4;
PCA4 = U4*mat4';

figure(4)
subplot(1,2,1), plot(percent4, 'O'), set(gca, 'Fontsize', 14)
title("Test 4: Energy Captured by Each Singular Value")
xlabel("Singular Values")
ylabel("Energy (%)")

subplot(3,2,2), plot(U4(:,1)), set(gca, 'Fontsize', 14)
title("Test 4: Position of Paint Can - First Mode")
xlabel("Time (Frame)")
ylabel("Position")
subplot(3,2,4), plot(U4(:,2)), set(gca, 'Fontsize', 14)
title("Test 4: Position of Paint Can - Second Mode")
xlabel("Time (Frame)")
ylabel("Position")
subplot(3,2,6), plot(U4(:,3)), set(gca, 'Fontsize', 14)
title("Test 4: Position of Paint Can - Third Mode")
xlabel("Time (Frame)")
ylabel("Position")

