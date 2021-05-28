function [FilteredImage] = AdaptiveLocalNoiseReductionFilter(image,windowSize)
%ADAPTIVELOCALNOISEREDUCTIONFILTER 이 함수의 요약 설명 위치
%   자세한 설명 위치
if size(image, 3) == 3 
    image = rgb2gray(image);
end

kernel = ones([windowSize, windowSize], 'double'); % 커널 정의
n = floor(windowSize/2);

[height, width] = size(image); % 입력 영상의 높이와 너비 추출
FilteredImage = zeros([height, width]); % 입력 영상의 크기에 따라서 스무딩 영상 초기화
image = double(image);
PaddedImage = zeros([height+2*n, width+2*n]);
PaddedImage(n+1:height+n, n+1:width+n) = image;
LocalMean = zeros([height, width]);
LocalVar = zeros([height, width]);

for i=n+1:height+n
    for j=n+1:width+n
        LocalMean(i-n, j-n) = mean(PaddedImage(i-n:i+n, j-n:j+n), 'all');
        LocalVar(i-n, j-n) = var(PaddedImage(i-n:i+n, j-n:j+n), 0, 'all');
    end
end

nvar = sum(LocalVar(:))/(height * width);
LocalVar = max(LocalVar,nvar);   
temp = PaddedImage(n+1:height+n, n+1:width+n);

FilteredImage = temp - nvar./LocalVar .* (temp - LocalMean);
FilteredImage = uint8(FilteredImage);
end

