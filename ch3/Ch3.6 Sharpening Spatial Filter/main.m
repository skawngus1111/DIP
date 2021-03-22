clc, clear, close all

data = [6, 6, 6, 6, 5, 4, 3, 2, 1, 1, 1, 1, 1, 1, 6, 6, 6, 6, 6];
firstD = firstDerivative(data);
secondD = secondDerivative(data);

figure(1);
plot(data, '--ks', 'MarkerFaceColor', 'k'); hold on;
plot(firstD, '-ro', 'MarkerFaceColor', 'r');
plot(secondD, '-bs');
plot([0, 20], [0, 0], 'k');
grid on;
legend('$f(x)$', '$\frac{\partial f}{\partial x}$', '$\frac{\partial^{2} f}{\partial x^{2}}$', 'Interpreter','latex');

I = imread('./example/Lenna.png');

if size(I, 3) == 3 
    I = rgb2gray(I);
end

[SharpenImageA, EdgeImageA] = Sharpening(I, 'A', 31);
[SharpenImageB, EdgeImageB] = Sharpening(I, 'B', 31);
[SharpenImageC, EdgeImageC] = Sharpening(I, 'C', 31);
[SharpenImageD, EdgeImageD] = Sharpening(I, 'D', 31);


figure(2);
subplot(2, 2, [1, 2]); imshow(I); title("Original image");
subplot(2, 2, 3); imshow(EdgeImageA); title("Edge image");
subplot(2, 2, 4); imshow(SharpenImageA); title("Sharpened image");

figure(3);
subplot(2, 2, [1, 2]); imshow(I); title("Original image");
subplot(2, 2, 3); imshow(EdgeImageB); title("Edge image");
subplot(2, 2, 4); imshow(SharpenImageB); title("Sharpened image");

figure(4);
subplot(2, 2, [1, 2]); imshow(I); title("Original image");
subplot(2, 2, 3); imshow(EdgeImageC); title("Edge image");
subplot(2, 2, 4); imshow(SharpenImageC); title("Sharpened image");

figure(5);
subplot(2, 2, [1, 2]); imshow(I); title("Original image");
subplot(2, 2, 3); imshow(EdgeImageD); title("Edge image");
subplot(2, 2, 4); imshow(SharpenImageD); title("Sharpened image");

[unsharpenImage, SmoothImage, diffImage] = unsharpenMasking(I, 31, 2);

figure(6);
subplot(2, 3, [1, 2, 3]); imshow(I); title("Original image");
subplot(3, 1, 1); imshow(SmoothImage); title("Smooth image");
subplot(3, 1, 2); imshow(diffImage); title("Differential image");
subplot(3, 1, 3); imshow(unsharpenImage); title("Unsharpen image");

EdgeImage=SobelFilter(I, 30);
imshow(EdgeImage)