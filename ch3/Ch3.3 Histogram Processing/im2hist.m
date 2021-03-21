function [hist] = im2hist(image, minValue, maxValue)
% im2his : 입력 영상을 히스토그램으로 변환하는 함수
% input
%   image : 입력 영상
%   minValue : 히스토그램의 최솟값
%   maxValue : 히스토그램의 최댓값
% output 
%   histogram : 입력 영상에 대한 히스토그램

[height, width] = size(image);
hist = zeros(1, maxValue);

for i=1:height
    for j=1:width
        value = image(i, j);
        if (value+1 >= minValue) && (value+1 <= maxValue)
            hist(value+1) = hist(value+1) + 1;
        end
    end
end
end

