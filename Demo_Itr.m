clear all; close all; clc;
%% read the image
x=im2double(imread('2.jpg'));
figure; imshow(x);title('Blurry Image')
%% create the PSF
len = 20;      % Length of motion
theta = 50;    % Angle of motion in degrees
PSF = fspecial('motion', len, theta);
% PSF = fspecial('gaussian',13,2);
  
tic; VC = VC(x, PSF, 15); toc;
figure; imshow(VC);title('Recovered by VC')
% imwrite (VC,'4VC.jpg')

tic; JVC = JVC(x, PSF, 0.09, 15); toc;
figure; imshow(JVC);title('Recovered by JVC')
% imwrite (JVC,'2JVC.jpg')

tic; LW = LW(x, PSF, 2, 15); toc;
figure; imshow(LW);title('Recovered by LW')
% imwrite (LW,'4LW.jpg')

tic; GD = GD(x, PSF, 15); toc;
figure; imshow(GD);title('Recovered by GD')
% imwrite (GD,'4GD.jpg')

tic; MU = MU(x, PSF, 15); toc;
figure; imshow(MU);title('Recovered by MU')
% imwrite (MU,'4MU.jpg')

tic; PM = PM(x, PSF, 15); toc;
figure; imshow(PM);title('Recovered by PM')
% imwrite (PM,'4PM.jpg')

tic; LR = LR(x, PSF, 15); toc;
figure; imshow(LR);title('Recovered by LR')
% imwrite (LR,'4LR.jpg')