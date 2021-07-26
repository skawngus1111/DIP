clc, clear, close all

if ~exist('result', 'dir')
    mkdir('result')
end

RGB = imread('../../example/Ch6/Fig0638(a)(lenna_RGB).tif');
HSV = rgb2hsv(RGB);

R = RGB(:, :, 1);
G = RGB(:, :, 2);
B = RGB(:, :, 3);

figure(1);
imshow(RGB);
saveas(gcf, './result/RGB_Image.png');

figure(2);
imshow([R, G, B]);
saveas(gcf, './result/RGB_component.png');

H = HSV(:, :, 1);
S = HSV(:, :, 2);
V = HSV(:, :, 3);

figure(3);
imshow([H, S, V]);
saveas(gcf, './result/HSV_component.png');

%% Color image Smoothing
RGB_smoothing = imgaussfilt(RGB);

HSV_smoothing = uint8(hsv2rgb(cat(3, H, S, imgaussfilt(V))) * 255);

figure(4);
imshow([RGB_smoothing, HSV_smoothing, (RGB_smoothing - HSV_smoothing + min(RGB_smoothing - HSV_smoothing)) * 10]);
saveas(gcf, './result/Smoothing.png');
%% Color image Sharpening
RGB_sharpening = imsharpen(RGB);

HSV_sharpening = uint8(hsv2rgb(cat(3, H, S, imsharpen(V))) * 255);

figure(5);
imshow([RGB_sharpening, HSV_sharpening, (RGB_sharpening - HSV_sharpening + min(RGB_sharpening - HSV_sharpening)) * 10]);
saveas(gcf, './result/Sharpening.png');