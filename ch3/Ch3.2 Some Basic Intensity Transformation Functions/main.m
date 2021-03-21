clc, clear, close all
% I = imread('../example/Einstein.jpg');
% I_negative = image_negative(I, 255);
% montage({I, I_negative})
% title("Original image(Left)&Negative image(right)")

% I_log = image_log(I, 1);
% montage({I, I_log});
% title("Original image(Left)&log image(c=1)(right)")

% I_log_1 = image_log(I, 1);
% I_log_0 = image_log(I, 0.5);
% I_log_2 = image_log(I, 2);
% montage({I, I_log_1, I_log_0, I_log_2});
% title("Original image(Up-Left)&log image(c=1)(Up-right)&(c=0.5)(Bottom-left)&(c=2)(Bottom-right)")

% I_gamma_1 = image_gamma(I, 0.5, 1);
% I_gamma_2 = image_gamma(I, 1, 1);
% I_gamma_3 = image_gamma(I, 2, 1);
% montage({I, I_gamma_1, I_gamma_2, I_gamma_3});
% title("Original image(Up-Left)&gamma image(gamma=0.5)(Up-right)&(gamma=1)(Bottom-left)&(gamma=2)(Bottom-right)")

% x = [2, 2, 3, 5, 6, 10];
% hist(x)

% I = imread('../example/MRI.jpg');
% subplot(1, 2, 1); imshow(I);
% subplot(1, 2, 2); imhist(I);

% I = imread('../example/Einstein.jpg');
% subplot(1, 2, 1); imshow(I);
% subplot(1, 2, 2); imhist(I);

% I = imread('../example/low_cont.jpg');
% subplot(1, 2, 1); imshow(I);
% subplot(1, 2, 2); imhist(I);

% I = imread('../example/high_cont.jpg');
% subplot(1, 2, 1); imshow(I);
% subplot(1, 2, 2); imhist(I);

I1 = imread('../example/MRI.jpg');
I2 = imread('../example/Einstein.jpg');
I3 = imread('../example/low_cont.jpg');
I4 = imread('../example/high_cont.jpg');
subplot(2, 4, 1); imshow(I1);
subplot(2, 4, 2); imshow(I2);
subplot(2, 4, 3); imshow(I3);
subplot(2, 4, 4); imshow(I4);
subplot(2, 4, 5); imhist(I1);
subplot(2, 4, 6); imhist(I2);
subplot(2, 4, 7); imhist(I3);
subplot(2, 4, 8); imhist(I4);
