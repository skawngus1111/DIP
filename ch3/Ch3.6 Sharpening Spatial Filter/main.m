clc, clear, close all

data = [6, 6, 6, 6, 5, 4, 3, 2, 1, 1, 1, 1, 1, 1, 6, 6, 6, 6, 6];
firstD = firstDerivative(data);
secondD = secondDerivative(data);

% figure(1);
% plot(data, '--ks', 'MarkerFaceColor', 'k'); hold on;
% plot(firstD, '-ro', 'MarkerFaceColor', 'r');
% plot(secondD, '-bs');
% plot([0, 20], [0, 0], 'k');
% grid on;
% legend('$f(x)$', '$\frac{\partial f}{\partial x}$', '$\frac{\partial^{2} f}{\partial x^{2}}$', 'Interpreter','latex');

I = imread('./example/Lenna.png');

if size(I, 3) == 3 
    I = rgb2gray(I);
end

[SharpenImageA, EdgeImageA] = Sharpening(I, 'A', 0);
[SharpenImageB, EdgeImageB] = Sharpening(I, 'B', 0);
[SharpenImageC, EdgeImageC] = Sharpening(I, 'C', 0);
[SharpenImageD, EdgeImageD] = Sharpening(I, 'D', 31);


% figure(2);
% subplot(2, 2, [1, 2]); imshow(I); title("Original image");
% subplot(2, 2, 3); imshow(EdgeImageA); title("Edge image");
% subplot(2, 2, 4); imshow(SharpenImageA); title("Sharpened image");
% 
% figure(3);
% subplot(2, 2, [1, 2]); imshow(I); title("Original image");
% subplot(2, 2, 3); imshow(EdgeImageB); title("Edge image");
% subplot(2, 2, 4); imshow(SharpenImageB); title("Sharpened image");
% 
% figure(4);
% subplot(2, 2, [1, 2]); imshow(I); title("Original image");
% subplot(2, 2, 3); imshow(EdgeImageC); title("Edge image");
% subplot(2, 2, 4); imshow(SharpenImageC); title("Sharpened image");
% 
% figure(5); 
% subplot(2, 2, [1, 2]); imshow(I); title("Original image");
% subplot(2, 2, 3); imshow(EdgeImageD); title("Edge image");
% subplot(2, 2, 4); imshow(SharpenImageD); title("Sharpened image");
% 
% figure(6); set(gcf,'units','points','position',[10,10,512*6,512]);
% subplot(1, 6, 1); imshow(I); title("Original image");
% for k=3:2:11
%     [SharpenImage, ~] = Sharpening(I, 'C', k);
%     subplot(1, 6, ceil(k/2)); imshow(SharpenImage);
% end

[unsharpenImage, SmoothImage, diffImage] = unsharpenMasking(I, 31, 1);

% figure(7);
% subplot(2, 3, [1, 2, 3]); imshow(I); title("Original image");
% subplot(2, 3, 4); imshow(SmoothImage); title("Smooth image");
% subplot(2, 3, 5); imshow(diffImage); title("Differential image");
% subplot(2, 3, 6); imshow(unsharpenImage); title("Unsharpen image");

I = imread('./example/moon.jpg');
if size(I, 3) == 3 
    I = rgb2gray(I);
end
% figure(8); set(gcf,'units','points','position',[10,10,1200,630*5]);
% for k=1:6
%     [unsharpenImage, ~, ~] = unsharpenMasking(I, 31, k);
%     subplot(3, 2, k); imshow(unsharpenImage);
% end

figure(9); set(gcf,'units','points','position',[10,10,1200,630*5]);
for k=1:6
    EdgeImage=SobelFilter(I, k*40);
    subplot(3, 2, k); imshow(EdgeImage);
end

figure(10); set(gcf,'units','points','position',[10,10,1200,630*5]);
for k=1:6
    EdgeImage=RobertsFilter(I, k*40);
    subplot(3, 2, k); imshow(EdgeImage);
end