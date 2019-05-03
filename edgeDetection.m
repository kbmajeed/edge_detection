%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  EDGE  DETECTION  ALGORITHMS 
%   Abdulmajeed Muhammad Kabir
%   G201409460
%   2nd/March/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% IMAGE ACQUISITION
clc; close all; clear all;

%Grayscale Bicycle Image
image_original = double(imread('D:\Bikesgray.jpg'))/255.; 

%Grayscale Coins Image
%image_original = double(imread('D:\coins.png'))/255.;

%Grayscale Rubiks Cube Image
%image_original = double(rgb2gray(imread('D:\rc.png')))/255.;

% Blur Image 
%blur_filter    = fspecial('gaussian',[17 17], 3);
%blur_filter    = fspecial('gaussian',[11 11], 4);
blur_filter    = fspecial('gaussian',[3 3], 0.5);
    
% Display Gaussian filter
figure(8);       surf(blur_filter);
image_blur     = imfilter(image_original,blur_filter);
%image_blur      = image_original; %Skip blurring process

% Display Blurred Image 
figure(1); imshow(image_original,[]); figure(2); imshow(image_blur,[]); %imshow assumes [0-1] for images
figure(3); imshowpair(image_original, image_blur,'montage');

%image_originald = double(image_blur)/255; %normalized 255 since uint8?
image_originald = image_blur; %Skip above normalization
%% Image Gradients (Sobel)
% Sobel kernel
%[gx,gy] = imgradientxy(image_originald, 'sobel'); 
figure(4); imshow(gx,[])
figure(5); imshow(gy,[])
% Magnitude and Angle of Gradients
[gmag,gdir] = imgradient(gx,gy);
figure(6); imshow(gmag,[]);
figure(7); imshow((gdir + 180)/360,[]);
figure(9); imshow(im2bw(gmag),[]);

%% Image Gradients (Prewitt)
% Prewitt kernel
% [gx,gy] = imgradientxy(image_originald, 'Prewitt'); 
% figure(4); imshow(gx,[])
% figure(5); imshow(gy,[])
% Magnitude and Angle of Gradients
% [gmag,gdir] = imgradient(gx,gy);
% figure(6); imshow(gmag,[]);
% figure(7); imshow((gdir + 180)/360,[]);
% figure(9); imshow(im2bw(gmag),[]);

%% Image Gradients (Robert)
%Roberts kernel
% [gmag,gdir] = imgradient(image_originald, 'roberts'); %image not normalized
% figure(10); imshow(gmag,[]);
% figure(11); imshow((gdir + 180)/360,[]);
% level1 = graythresh(gmag);
% BW1    = im2bw(gmag,level1);
% figure(12); imshow(BW1,[]); %imshow(im2bw(gmag),[]);

%% Image Gradients (Laplacian)
% Laplacian kernel
% alpha     = 0.2;
% Laplacian = fspecial('laplacian',alpha);
% image_edge_laplacian = imfilter(image_originald,Laplacian,'replicate');
% figure(13); imshow(image_edge_laplacian,[]);
% level2 = graythresh(image_edge_laplacian);
% BW2    = im2bw(image_edge_laplacian,level2);
% figure(14); imshow(BW2,[]); %imshow(im2bw(gmag),[]);


%% Derivative of Noisy Signal # From Simulink
% figure(20);
% plot(time,signal,'r','LineWidth',5)
% figure(21)
% plot(time,signaldydx,'b-.','LineWidth',1)
% figure(22)
% plot(time,signaldydx2,'g:','LineWidth',1)



