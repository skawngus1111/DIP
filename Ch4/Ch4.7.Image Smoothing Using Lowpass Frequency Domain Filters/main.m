clc, clear, close all

if ~exist('result', 'dir')
    mkdir('result')
end

I = imread('../../example/Ch4/Fig0441(a)(characters_test_pattern).tif');

D0s = [10, 30, 60, 160, 460, 500, 550, 600];

figure(1);
subplot('Position',[0 2/3 1/3 1/3]); imshow(I);

for i = 1:length(D0s)
    D0 = D0s(i);
    reject_image = LPF(I, D0,"ideal",1);
    subplot('Position',[(mod(i,3))/3 1-(ceil((i+1)/3))/3 1/3 1/3]); imshow(reject_image);
end
p = get(gcf,'Position');
k = [size(I,2) size(I,1)]/(size(I,2)+size(I,1));
set(gcf,'Position',[p(1) p(2) (p(3)+p(4)).*k]) %// adjust figure x and y size
saveas(gcf, './result/ILPF.png');

figure(2);
subplot('Position',[0 2/3 1/3 1/3]); imshow(I);

for i = 1:length(D0s)
    D0 = D0s(i);
    reject_image = LPF(I, D0,"butterworth",2.25);
    subplot('Position',[(mod(i,3))/3 1-(ceil((i+1)/3))/3 1/3 1/3]); imshow(reject_image);
end
p = get(gcf,'Position');
k = [size(I,2) size(I,1)]/(size(I,2)+size(I,1));
set(gcf,'Position',[p(1) p(2) (p(3)+p(4)).*k]) %// adjust figure x and y size
saveas(gcf, './result/BLPF.png');

figure(3);
subplot('Position',[0 2/3 1/3 1/3]); imshow(I);

for i = 1:length(D0s)
    D0 = D0s(i);
    reject_image = LPF(I, D0,"Gaussian");
    subplot('Position',[(mod(i,3))/3 1-(ceil((i+1)/3))/3 1/3 1/3]); imshow(reject_image);
end
p = get(gcf,'Position');
k = [size(I,2) size(I,1)]/(size(I,2)+size(I,1));
set(gcf,'Position',[p(1) p(2) (p(3)+p(4)).*k]) %// adjust figure x and y size
saveas(gcf, './result/GLPF.png');