clear, clc, close all
addpath('./ch3')
addpath('./ch3/utils')

minValue=1; maxValue=256;
I = imread('./example/Einstein.jpg');

figure(1); 
subplot(1, 2, 1); imshow(I); title('input image');
subplot(1, 2,2); bar(im2hist(I, minValue, maxValue)); title('histogram of input image');

% I = grayslice(I, 2^3);
[equalizedImage, cdf] = histequal(I, minValue, maxValue);

I_eq = histeq(I);

figure(2);
subplot(3, 3, 1); imshow(I); title("input image");
subplot(3, 3, 2); imshow(equalizedImage); title("custom");
subplot(3, 3, 3); imshow(I_eq); title("matlab");
axis tight; axis off

subplot(3, 3, 4); bar(im2hist(I, minValue, maxValue)); xlim([minValue, maxValue]);
subplot(3, 3, 5); bar(im2hist(equalizedImage, minValue, maxValue)); xlim([minValue, maxValue]);
subplot(3, 3, 6); bar(im2hist(I_eq, minValue, maxValue)); xlim([minValue, maxValue]);

subplot(3, 3, [7, 8, 9]); 
plot(cdf, 'r', 'LineWidth', 2); 
xlim([minValue, maxValue]); ylim([minValue, maxValue]);
title("image transform function, s=T(r)");

SourceImage = imread('./example/low_cont.jpg'); % source image
TargetImage = imread('./example/high_cont.jpg'); % target image

TargetImage = rgb2gray(TargetImage);

[MatchedImage, InverseTargetCDF, TargetCDF] = histMatching(SourceImage, TargetImage, minValue, maxValue);
matlabCode = imhistmatch(SourceImage, TargetImage);

figure(3);
subplot(3, 4, 1); imshow(SourceImage); title("Source image");
subplot(3, 4, 2); imshow(TargetImage); title("Target image");
subplot(3, 4, 3); imshow(MatchedImage); title("Matched Image");
subplot(3, 4, 4); imshow(matlabCode); title("MATLAB Code");

subplot(3, 4, 5); bar(im2hist(SourceImage, minValue, maxValue)); xlim([minValue, maxValue]);
subplot(3, 4, 6); bar(im2hist(TargetImage, minValue, maxValue)); xlim([minValue, maxValue]);
subplot(3, 4, 7); bar(im2hist(MatchedImage, minValue, maxValue)); xlim([minValue, maxValue]);
subplot(3, 4, 8); bar(im2hist(matlabCode, minValue, maxValue)); xlim([minValue, maxValue]);

subplot(3, 4, [9, 10, 11, 12]); 
plot(TargetCDF, 'r', 'LineWidth', 2); hold on;
plot(InverseTargetCDF, 'r:', 'LineWidth', 2);
plot([minValue, maxValue], [minValue, maxValue], 'k:', 'LineWidth', 2);
xlim([minValue, maxValue]); ylim([minValue, maxValue]);
title("image transform function"); legend("$G(z)$", "$G^{-1}(s)$", "$y=x$", 'Interpreter','latex')