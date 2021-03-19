clc, clear, close all

I = imread('./example/Lenna.png');

figure(1);
subplot(3, 3, 1); imshow(I); title("Original");
subplot(3, 3, 2); imshow(BoxFilterForLoop(I, 3)); title("Smoothing($k=3$)", 'Interpreter','latex');
subplot(3, 3, 3); imshow(BoxFilterForLoop(I, 5)); title("Smoothing($k=5$)", 'Interpreter','latex');
subplot(3, 3, 4); imshow(BoxFilterForLoop(I, 7)); title("Smoothing($k=7$)", 'Interpreter','latex');
subplot(3, 3, 5); imshow(BoxFilterForLoop(I, 9)); title("Smoothing($k=9$)", 'Interpreter','latex');
subplot(3, 3, 6); imshow(BoxFilterForLoop(I, 11)); title("Smoothing($k=11$)", 'Interpreter','latex');
subplot(3, 3, 7); imshow(BoxFilterForLoop(I, 13)); title("Smoothing($k=13$)", 'Interpreter','latex');
subplot(3, 3, 8); imshow(BoxFilterForLoop(I, 15)); title("Smoothing($k=15$)", 'Interpreter','latex');
subplot(3, 3, 9); imshow(BoxFilterForLoop(I, 17)); title("Smoothing($k=17$)", 'Interpreter','latex');

figure(2);
subplot(3, 3, 1); imshow(I); title("Original");
subplot(3, 3, 2); imshow(BoxFilterVector(I, 3)); title("Smoothing($k=3$)", 'Interpreter','latex');
subplot(3, 3, 3); imshow(BoxFilterVector(I, 5)); title("Smoothing($k=5$)", 'Interpreter','latex');
subplot(3, 3, 4); imshow(BoxFilterVector(I, 7)); title("Smoothing($k=7$)", 'Interpreter','latex');
subplot(3, 3, 5); imshow(BoxFilterVector(I, 9)); title("Smoothing($k=9$)", 'Interpreter','latex');
subplot(3, 3, 6); imshow(BoxFilterVector(I, 11)); title("Smoothing($k=11$)", 'Interpreter','latex');
subplot(3, 3, 7); imshow(BoxFilterVector(I, 13)); title("Smoothing($k=13$)", 'Interpreter','latex');
subplot(3, 3, 8); imshow(BoxFilterVector(I, 15)); title("Smoothing($k=15$)", 'Interpreter','latex');
subplot(3, 3, 9); imshow(BoxFilterVector(I, 51)); title("Smoothing($k=17$)", 'Interpreter','latex');

if size(I, 3) == 3 
    I = rgb2gray(I);
end

CurruptImage = imnoise(I, 'salt & pepper');
SmoothImage = BoxFilterForLoop(CurruptImage,3);
FilteredImage = MedianFilter(CurruptImage,3);

figure(3);
subplot(2, 2, 1); imshow(I); title("Original Image");
subplot(2, 2, 2); imshow(CurruptImage); title("Noise Image");
subplot(2, 2, 3); imshow(SmoothImage); title("Smooth Image");
subplot(2, 2, 4); imshow(FilteredImage); title("Filtered Image");

figure(4);
subplot(3, 3, [1, 2, 3]); imshow(I); title("Original Image");
subplot(3, 3, 4); imshow(MedianFilter(I,3)); title("Median Image(k=3)");
subplot(3, 3, 5); imshow(MaxFilter(I,3)); title("Max Image(k=3)");
subplot(3, 3, 6); imshow(MinFilter(I,3)); title("Min Image(k=3)");
subplot(3, 3, 7); imshow(MedianFilter(I,11)); title("Median Image(k=11)");
subplot(3, 3, 8); imshow(MaxFilter(I,11)); title("Max Image(k=11)");
subplot(3, 3, 9); imshow(MinFilter(I,11)); title("Min Image(k=11)");
