% Clean workspace
clear all; close all; clc

load subdata.mat % Imports the data as the 262144x49 (space by time) matrix called subdata

L = 10; % spatial domain
n = 64; % Fourier modes
x2 = linspace(-L,L,n+1); x = x2(1:n); y =x; z = x;
k = (2*pi/(2*L))*[0:(n/2 - 1) -n/2:-1]; 
ks = fftshift(k);

[X,Y,Z]=meshgrid(x,y,z);
[Kx,Ky,Kz]=meshgrid(ks,ks,ks);


for j=1:49
Un(:,:,:)=reshape(subdata(:,j),n,n,n);
M = max(abs(Un),[],'all');
close all, isosurface(X,Y,Z,abs(Un)/M,0.7)
axis([-20 20 -20 20 -20 20]), grid on, drawnow
end

%Uave Central Frequency
Uave = zeros(n,n,n);
for j=1:49
Un(:,:,:)=reshape(subdata(:,j),n,n,n);
Utn(:,:,:)=fftn(Un(:,:,:));
Uave = Uave + Utn(:,:,:);
end
Uave = fftshift(Uave)/49;
M = max(abs(Uave),[],'all');
close all, isosurface(Kx,Ky,Kz,abs(Uave)/M,0.7)
axis([-10 10 -10 10 -10 10]), grid on, drawnow
title('Central Frequency')
xlabel("X Axis"), ylabel("Y Axis"), zlabel("Z Axis")

%Inverse Transform

x0 = 5;
y0 = -7;
z0 = 2.2;
filter = fftshift(exp((-(Kx-x0).^2 - (Ky-y0).^2)-(Kz-z0).^2));
px = zeros(1,49);
py = zeros(1,49);
pz = zeros(1,49);
for j=1:49
    Un(:,:,:) = reshape(subdata(:,j),n,n,n);
    Utnf = fftn(Un).*filter;
    uitn = ifftn(Utnf);
    [M, idx] = max(abs(uitn),[],'all', 'linear');
    [xc, yc, zc] = ind2sub([64 64 64], idx);
    xcord = Kx(xc,yc,zc);
    ycord = Ky(xc,yc,zc);
    zcord = Kz(xc,yc,zc);
    px(1,j) = xcord;
    py(1,j) = ycord;
    pz(1,j) = zcord;
end

plot3(px,py,pz), grid on
title('Path of Submarine in Spatial Domain')
xlabel("X Axis"), ylabel("Y Axis"), zlabel("Z Axis")
