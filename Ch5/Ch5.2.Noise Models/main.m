clc, clear, close all

%% Random Variable
SampleSize = [1, 5e5];

figure(1)

% Rayleigh Random Variable
z = randraw('rayl', 1, SampleSize);
subplot(5, 1, 1); histogram(z); title('Rayleigh');

% Normal Random Variable
z = randraw('normal', [], SampleSize);
subplot(5, 1, 2); histogram(z); title('Normal');

% Erlang Random Variable
z = randraw('erlang', [1, 3], SampleSize);
subplot(5, 1, 3); histogram(z); title('Erlang');

% Exponential Random Variable
z = randraw('exponential', 1, SampleSize);
subplot(5, 1, 4); histogram(z); title('Exponential');

% Uniform Random Variable
z = randraw('uniform', [], SampleSize);
subplot(5, 1, 5); histogram(z); title('Uniform');

saveas(gcf, './result/RandomVariableHistogram.png');
%% Add Noise
I = imread('../../example/Ch5/Fig0503 (original_pattern).tif');

% Gaussian Noise
mu1 = 0.0;
sigma1 = 1.0;
I_normal1 = im2double(I) + (sigma1 * randraw('normal', [], size(I)) + mu1);

mu2 = 1.0;
sigma2 = 1.0;
I_normal2 = im2double(I) + (sigma2 * randraw('normal', [], size(I)) + mu2);

mu3 = 0.0;
sigma3 = 5.0;
I_normal3 = im2double(I) + (sigma3 * randraw('normal', [], size(I)) + mu3);

figure(2);
subplot(2, 2, 1); imshow(I); title('original');
subplot(2, 2, 2); imshow(I_normal1); title('standard normal');
subplot(2, 2, 3); imshow(I_normal2); title('normal with mean=1.0, var=1.0');
subplot(2, 2, 4); imshow(I_normal3); title('normal with mean=0.0, var=5.0');

saveas(gcf, './result/GaussianNoise.png');

% Rayleigh Noise
sigma1 = 1.0;
I_rayl1 = im2double(I) + randraw('rayl', sigma1, size(I));

sigma2 = 0.5;
I_rayl2 = im2double(I) + randraw('rayl', sigma2, size(I));

sigma3 = 2.0;
I_rayl3 = im2double(I) + randraw('rayl', sigma3, size(I));

figure(3);
subplot(2, 2, 1); imshow(I); title('original');
subplot(2, 2, 2); imshow(I_rayl1); title('Rayleigh with var = 1.0');
subplot(2, 2, 3); imshow(I_rayl2); title('Rayleigh with var = 0.5');
subplot(2, 2, 4); imshow(I_rayl3); title('Rayleigh with var = 2.0');

saveas(gcf, './result/RayleighNoise.png');