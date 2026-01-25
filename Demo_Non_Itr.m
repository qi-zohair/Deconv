clear all; close all; clc;
%% read the image
x=im2double(imread('1.jpg'));
figure; imshow(x);title('Blurry Image')
%% create the PSF
len = 10;      % Length of motion
theta = 30;    % Angle of motion in degrees
PSF = fspecial('motion', len, theta);
% PSF = fspecial('gaussian',13,2);

tic; MZ = MZ(x, PSF, 120); toc;
figure; imshow(MZ);title('Recovered by MZ')
% imwrite (MZ,'4MZ.jpg')

tic; LLS = LLS(x, PSF); toc;
figure; imshow(LLS);title('Recovered by LLS')
% imwrite (LLS,'4LLS.jpg')

tic; WR = WR(x, PSF, 0.01); toc;
figure; imshow(WR);title('Recovered by WR')
% imwrite (WR,'4WR.jpg')

tic; CLS = CLS(x, PSF, 0.01); toc;
figure; imshow(CLS);title('Recovered by CLS')
% imwrite (CLS,'4CLS.jpg')

tic; GP = GP(x, PSF, 0.01); toc;
figure; imshow(GP);title('Recovered by GP')
% imwrite (GP,'4GP.jpg')

tic; ZR = ZR(x, PSF, 30, 0.1); toc;
figure; imshow(ZR);title('Recovered by ZR')
% imwrite (ZR,'4ZR.jpg')

tic; RI = RI(x, PSF, .01); toc;
figure; imshow(RI);title('Recovered by RI')
% imwrite (RI,'4RI.jpg')
