function [FilteredImage] = AlphaTrimmedMeanFilter(image,windowSize, d)
%ALPHATRIMMEDMEANFILTER 이 함수의 요약 설명 위치
%   자세한 설명 위치
if size(image, 3) == 3 
    image = rgb2gray(image);
end

n = floor(windowSize/2);

[height, width] = size(image); % 입력 영상의 높이와 너비 추출
FilteredImage = zeros([height, width], 'uint8'); % 입력 영상의 크기에 따라서 스무딩 영상 초기화
image = double(image);
PaddedImage = zeros([height+2*n, width+2*n]);
PaddedImage(n+1:height+n, n+1:width+n) = image;

for i=n+1:height+n % 입력 영상의 높이
    for j=n+1:width+n % 입력 영상이 너비
        InteresteValues = sort(reshape(PaddedImage(i-n:i+n, j-n:j+n), [1, windowSize^2]));
        FilteredImage(i-n, j-n) = sum(InteresteValues(d/2 + 1:windowSize^2-d/2)) / (windowSize^2 - d);
%         FilteredImage(i-n, j-n) = median(sort(reshape(PaddedImage(i-n:i+n, j-n:j+n), [1, windowSize^2])));
    end
end

end

