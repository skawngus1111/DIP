function [EdgeImage] = RobertsFilter(image, threshold)
%UNTITLED11 이 함수의 요약 설명 위치
%   자세한 설명 위치
kernelX = [-1 0;
           0 1];
kernelY = [0 1;
           -1 0];
       
n = floor(size(kernelX, 2)/2);
[height, width] = size(image); % 입력 영상의 높이와 너비 추출
EdgeImage = zeros([height, width], 'double'); % 입력 영상의 크기에 따라서 스무딩 영상 초기화
image = double(image);
PaddedImage = zeros([height+2*n, width+2*n]);
PaddedImage(n+1:height+n, n+1:width+n) = image;

for i=n+1:height+n % 입력 영상의 높이
    for j=n+1:width+n % 입력 영상이 너비
        % (i, j)에 해당하는 픽셀에 윈도우의 크기만큼 linear smoothing 수행
        magX = 0.0;
        magY = 0.0;
        for s=1:2
            for t=1:2
                magX = magX + kernelX(s, t)*PaddedImage(i+s-1, j+t-1);
                magY = magY + kernelY(s, t)*PaddedImage(i+s-1, j+t-1);
            end
        end
        EdgeImage(i-n, j-n) = sqrt(magX^2 + magY^2);
    end
end

EdgeImage = cast(EdgeImage, 'uint8');
EdgeImage(EdgeImage >= threshold) = 255;
EdgeImage(EdgeImage < threshold) = 0;
end

