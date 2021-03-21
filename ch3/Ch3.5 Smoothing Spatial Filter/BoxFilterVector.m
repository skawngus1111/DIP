function [SmoothImage] = BoxFilterVector(image, window)
%BoxFilterVector BoxFilterForLoop의 Vectorization 버전
%   input 
%       1. image : 입력 영상
%       2. window : 커널의 크기
%   output
%       1. SmoothImage : 스무딩된 영상

if size(image, 3) == 3 
    image = rgb2gray(image);
end

kernel = ones([window, window], 'double'); % 커널 정의
n = floor(window/2);

[height, width] = size(image); % 입력 영상의 높이와 너비 추출
SmoothImage = zeros([height, width], 'uint8'); % 입력 영상의 크기에 따라서 스무딩 영상 초기화
image = double(image);
PaddedImage = zeros([height+2*n, width+2*n]);
PaddedImage(n+1:height+n, n+1:width+n) = image;

for i=n+1:height+n % 입력 영상의 높이
    for j=n+1:width+n % 입력 영상이 너비
        % (i, j)에 해당하는 픽셀에 윈도우의 크기만큼 linear smoothing 수행
        SmoothImage(i-n, j-n) = sum(kernel .* PaddedImage(i-n:i+n, j-n:j+n), 'all')/(window^2);
    end
end
end

