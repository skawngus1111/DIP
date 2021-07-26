clc, clear, close all

if ~exist('result', 'dir')
    mkdir('result')
end

addpath('../../Common Library')
addpath('../../Common Library/randraw/')


I = imread('../../example/Ch5/Fig0507(a)(ckt-board-orig).tif');
%% Mean Filter
I_corruption = im2double(I) + (0.2 * randraw('normal', [], size(I)));

% Arithmetic Mean Filter
ArithmeticSmoothing = ArithmeticMeanFilter(I_corruption, 7);

% Geometic Mean Filter
GeometricSmoothing = GeometricMeanFilter(I_corruption, 3);

% Harmonic Mean Filter
HarmonicSmoothing = HarmonicMeanFilter(I_corruption, 5);

% Contraharmonic Mean Filter
% ContraHarmonicSmoothing = ContraHarmonicMeanFilter(I_corruption, 3, 0.5);

figure(1);
imshow([I_corruption ArithmeticSmoothing; GeometricSmoothing HarmonicSmoothing]);
saveas(gcf, './result/MeanFilterExample.png');
 
I_black = SaltAndPepper(I, 0.1, 0.0);
BlackSmoothing = ContraHarmonicMeanFilter(I_black, 3, 1.5);

I_white = SaltAndPepper(I, 0.1, 1.0);
WhiteSmoothing = ContraHarmonicMeanFilter(I_white, 3, -1.5);

WhiteWrongSmoothing = ContraHarmonicMeanFilter(I_black, 3, -1.5);
BlackWrongSmoothing = ContraHarmonicMeanFilter(I_white, 3, 1.5);

I_blackwhite = SaltAndPepper(I, 0.1, 0.5);
BlackWhiteSmoothing1 = ContraHarmonicMeanFilter(I_blackwhite, 3, 1.5);
BlackWhiteSmoothing2 = ContraHarmonicMeanFilter(I_blackwhite, 3, -1.5);

figure(2);
imshow([I_black I_white; BlackSmoothing WhiteSmoothing]);
saveas(gcf, './result/ContraHarmonicMeanFilterExample.png');

figure(3);
imshow([WhiteWrongSmoothing BlackWrongSmoothing]);
saveas(gcf, './result/ContraHarmonicMeanFilterFailedExample1.png');

figure(4);
imshow([I_blackwhite BlackWhiteSmoothing1 BlackWhiteSmoothing2]);
saveas(gcf, './result/ContraHarmonicMeanFilterFailedExample2.png');
%% Order-Statistic Filter

I_blackwhite = SaltAndPepper(I, 0.1, 0.5);

% Median Filter
MedianSmoothing = MedianFilter(I_blackwhite, 3);

figure(5);
imshow([I I_blackwhite MedianSmoothing])
saveas(gcf, './result/MedianFilterExample.png');

% % Max Filter
% MaxSmoothing = MaxFilter(I_blackwhite, 21);
% 
% % Min Filter
% MinSmoothing = MinFilter(I_blackwhite, 21);
% 
% % Midpoint Filter
% MidpointSmoothing = MidpointFilter(I_blackwhite, 3);

% Alpha-Trimmed Mean Filter
% AlphaTrimmedSmoothing = AlphaTrimmedMeanFilter(I_blackwhite, 3, 3^2 - 1);

I_gaussianNoise = imnoise(I, 'gaussian');
I_blackwhite = SaltAndPepper(I_gaussianNoise, 0.1, 0.5);


ArithmeticSmoothing = ArithmeticMeanFilter(I_blackwhite, 5);
GeometricSmoothing = GeometricMeanFilter(I_blackwhite, 5);
MedianSmoothing = MedianFilter(I_blackwhite, 5);
AlphaTrimmedSmoothing = AlphaTrimmedMeanFilter(I_blackwhite, 5, 6);

figure(6);
imshow([I_gaussianNoise I_blackwhite; 
        ArithmeticSmoothing GeometricSmoothing;
        MedianSmoothing AlphaTrimmedSmoothing])
saveas(gcf, './result/MultiNoiseExample.png');
%% Adaptive Filter

% Adaptive, Local Noise Reduction Filter
I = imread('../../example/Ch5/Fig0513(a)(ckt_gaussian_var_1000_mean_0).tif');
ArithmeticSmoothing = ArithmeticMeanFilter(I, 7);
GeometricSmoothing = GeometricMeanFilter(I, 7);
FilteredImage = AdaptiveLocalNoiseReductionFilter(I, 7);

figure(7);
imshow([I ArithmeticSmoothing; 
        GeometricSmoothing FilteredImage])
saveas(gcf, './result/AdaptiveLocalNoiseReductionFilterExample.png');

% Adaptive Median Filter
I = imread('../../example/Ch5/Fig0514(a)(ckt_saltpep_prob_pt25).tif');
MedianSmoothing = MedianFilter(I, 11);
FilteredImage=AdaptiveMedianFilter(I, 3, 11);
figure(8);
imshow([I MedianSmoothing FilteredImage])
saveas(gcf, './result/AdaptiveMedianFilterExample.png');