clc, clear, close all

if ~exist('result', 'dir')
    mkdir('result')
end

I = imread('../../example/Ch4/Fig0441(a)(characters_test_pattern).tif');

D0s = [10, 30, 60, 160, 460, 500, 550, 600];

% High Pass Filtering 구현
figure(1);
subplot('Position',[0 2/3 1/3 1/3]); imshow(I);

for i = 1:length(D0s)
    D0 = D0s(i);
    reject_image = HPF(I, D0,"ideal",1);
    subplot('Position',[(mod(i,3))/3 1-(ceil((i+1)/3))/3 1/3 1/3]); imshow(reject_image);
end
p = get(gcf,'Position');
k = [size(I,2) size(I,1)]/(size(I,2)+size(I,1));
set(gcf,'Position',[p(1) p(2) (p(3)+p(4)).*k]) %// adjust figure x and y size
saveas(gcf, './result/IHPF.png');

figure(2);
subplot('Position',[0 2/3 1/3 1/3]); imshow(I);

for i = 1:length(D0s)
    D0 = D0s(i);
    reject_image = HPF(I, D0,"butterworth",2);
    subplot('Position',[(mod(i,3))/3 1-(ceil((i+1)/3))/3 1/3 1/3]); imshow(reject_image);
end
p = get(gcf,'Position');
k = [size(I,2) size(I,1)]/(size(I,2)+size(I,1));
set(gcf,'Position',[p(1) p(2) (p(3)+p(4)).*k]) %// adjust figure x and y size
saveas(gcf, './result/BHPF.png');

figure(3);
subplot('Position',[0 2/3 1/3 1/3]); imshow(I);

for i = 1:length(D0s)
    D0 = D0s(i);
    reject_image = HPF(I, D0,"gaussian");
    subplot('Position',[(mod(i,3))/3 1-(ceil((i+1)/3))/3 1/3 1/3]); imshow(reject_image);
end
p = get(gcf,'Position');
k = [size(I,2) size(I,1)]/(size(I,2)+size(I,1));
set(gcf,'Position',[p(1) p(2) (p(3)+p(4)).*k]) %// adjust figure x and y size
saveas(gcf, './result/GHPF.png');

%% Laplacian Filtering
clc, clear, close all

if ~exist('result', 'dir')
    mkdir('result')
end

I = imread('../../example/Ch4/Fig0458(a)(blurry_moon).tif');

[sharpen_image, laplacian_image] = LaplacianFiltering(I);
diff = uint8(abs(double(I) - double(sharpen_image))) * 255;

figure(1);
subplot('position', [0.0 0.25 0.5 0.5]); imshow(I); title('input image');
subplot('position', [0.5 0.25 0.5 0.5]); imshow(I); title('sharpen image');
p = get(gcf,'Position');
k = [size(I,2) size(I,1)]/(size(I,2)+size(I,1));
set(gcf,'Position',[p(1) p(2) (p(3)+p(4)).*k]) %// adjust figure x and y size
saveas(gcf, './result/Laplacian.png');
%% Unsharpening Mask
clc, clear, close all

k1 = 1.5;
k2 = 1.75;
type = 'butterworth';
D0 = 70;
n = 2;

if ~exist('result', 'dir')
    mkdir('result')
end

I = imread('../../example/Ch4/Fig0459(a)(orig_chest_xray).tif');

filtered_image = HighFrequencyEmphasisFiltering(I, k1, k2, type, D0, n);

figure(1);
subplot('position', [0.0 0.25 0.5 0.5]); imshow(I); title('input image');
subplot('position', [0.5 0.25 0.5 0.5]); imshow(filtered_image); title('sharpen image');
p = get(gcf,'Position');
k = [size(I,2) size(I,1)]/(size(I,2)+size(I,1));
set(gcf,'Position',[p(1) p(2) (p(3)+p(4)).*k]) %// adjust figure x and y size
saveas(gcf, './result/HFemphasis.png');
%% Homomorphic Filtering
clc, clear, close all

D0 = 20;
gammaL = 0.999;
gammaH = 3.0;
type = 'butterworth';
n = 2;

if ~exist('result', 'dir')
    mkdir('result')
end

I = imread('../../example/Ch4/Fig0462(a)(PET_image).tif');
filtered_image = HomomorphicFiltering(I, D0, gammaL, gammaH, type, n);

figure(1);
subplot('position', [0.0 0.25 0.5 0.5]); imshow(I); title('input image');
subplot('position', [0.5 0.25 0.5 0.5]); imshow(filtered_image); title('filtered image');
p = get(gcf,'Position');
k = [size(I,2) size(I,1)]/(size(I,2)+size(I,1));
set(gcf,'Position',[p(1) p(2) (p(3)+p(4)).*k]) %// adjust figure x and y size
saveas(gcf, './result/HomomorphicFiltering.png');