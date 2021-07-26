clc, clear, close all

if ~exist('result', 'dir')
    mkdir('result')
end

addpath('../../Common Library')
addpath('../../Common Library/randraw/')
%% Notch Filtering
I = imread('../../example/Ch5/Fig0516(a)(applo17_boulder_noisy).tif');
I_fft = fftshift(fft2(I));
I_spectrum = mat2gray(20 * log(1 + abs(I_fft)));

mask1 = BandRejectMask(I, 135, 10);
mask2 = BandRejectMask(I, 185, 20);

figure(1);
imshow(I);

figure(2);
imshow(I_spectrum .* mask1 .* mask2);

I_reject = I_fft .* mask1 .* mask2;
I_recover = abs(ifft2(ifftshift(I_reject)));
I_recover = mat2gray(I_recover);
figure(3);
imshow(I_recover);
%% Optimal Notch Filtering
