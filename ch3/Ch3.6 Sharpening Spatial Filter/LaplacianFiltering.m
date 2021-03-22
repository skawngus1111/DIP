function [EdgeImage] = LaplacianFiltering(image, type, window)
%UNTITLED8 이 함수의 요약 설명 위치
%   자세한 설명 위치
if size(image, 3) == 3 
    image = rgb2gray(image);
end

if type=='A'
    kernel = [0 1 0;
              1 -4 1;
              0 1 0];
elseif type == 'B' 
    kernel = [1 1 1;
              1 -8 1;
              1 1 1];
elseif type == 'C'
    kernel = [0 -1 0;
              -1 4 -1;
              0 -1 0];
elseif type == 'D'
    kernel = [-1 -1 -1;
              -1 8 -1;
              -1 -1 -1];
end

n = floor(size(kernel, 2)/2);
[height, width] = size(image); % 입력 영상의 높이와 너비 추출
EdgeImage = zeros([height, width], 'double'); % 입력 영상의 크기에 따라서 스무딩 영상 초기화
if window > 0 
    image = BoxFilterForLoop(image, window);
end
image = double(image);
PaddedImage = zeros([height+2*n, width+2*n]);
PaddedImage(n+1:height+n, n+1:width+n) = image;

for i=n+1:height+n % 입력 영상의 높이
    for j=n+1:width+n % 입력 영상이 너비
        % (i, j)에 해당하는 픽셀에 윈도우의 크기만큼 linear smoothing 수행
        pixelValue = 0.0;
        for s=-n:n
            for t=-n:n
                pixelValue = pixelValue + kernel(s+n+1, t+n+1)*PaddedImage(i+s, j+t);
            end
        end
        EdgeImage(i-n, j-n) = pixelValue;
    end
end

EdgeImage = cast(EdgeImage, 'uint8');
if type == 'A' || type == 'B'
    EdgeImage = EdgeImage - min(EdgeImage, [], 'all');
elseif type == 'C' || type == 'D'
    EdgeImage = EdgeImage + min(EdgeImage, [], 'all');
end
EdgeImage = EdgeImage * (255.0/max(EdgeImage, [], 'all'));
end

