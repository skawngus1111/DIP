function [SmoothImage] = GeometricMeanFilter(image,windowSize)
%ARITHMETICMEANFILTER 이 함수의 요약 설명 위치
%   자세한 설명 위치
if size(image, 3) == 3 
    image = rgb2gray(image);
end

kernel = ones([windowSize, windowSize], 'double'); % 커널 정의
n = floor(windowSize/2);

[height, width] = size(image); % 입력 영상의 높이와 너비 추출
SmoothImage = zeros([height, width]); % 입력 영상의 크기에 따라서 스무딩 영상 초기화
image = double(image);
PaddedImage = zeros([height+2*n, width+2*n]);
PaddedImage(n+1:height+n, n+1:width+n) = image;


for i=n+1:height+n % 입력 영상의 높이
    for j=n+1:width+n % 입력 영상이 너비
        % (i, j)에 해당하는 픽셀에 윈도우의 크기만큼 linear smoothing 수행
        pixelValue = 1.0;
        for s=-n:n
            for t=-n:n
                pixelValue = pixelValue * kernel(s+n+1, t+n+1)*PaddedImage(i+s, j+t);
            end
        end
        SmoothImage(i-n, j-n) = nthroot(pixelValue, windowSize^2);
    end
end

end
