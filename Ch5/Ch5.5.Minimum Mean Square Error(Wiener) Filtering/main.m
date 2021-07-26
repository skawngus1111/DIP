clc, clear, close all

%% Load Cameraman image
Ioriginal = imread('cameraman.tif');
imshow(Ioriginal); title('Original Image');
%% Apply Motion Blur to original image
PSF = fspecial('motion', 21, 11);
Idouble = im2double(Ioriginal);
blurred = imfilter(Idouble, PSF, 'conv', 'circular');
imshow(blurred); title('Blurred Image');
%% Restore Blurred Image using 'deconvwnr'
wnr1 = deconvwnr(blurred, PSF);
imshow(wnr1); title('Restored Image');