function [EqualizedImage] = LocalHistogramEqualization(image, minValue, maxValue, kernelSize, Stride)
%LocalHistogramEqualization : 지역 히스토그램 평활화를 수행하는 함수
%   input 
%       1. image : 입력 영상
%       2. minValue, maxValue : 입력 영상 밝기값의 최솟값과 최댓값
%       3. kernelSize : 지역 히스토그램을 적용할 윈도우의 크기
%       4. Stride : 픽셀을 몇 칸 건너서 이동할 건 지?
%   output
%       1. MatchedImage : target 영상을 이용해서 source 영상을 매칭시킨 출력 영상
%       2. GInverse : s -> z로 변환하는 G의 역변환
%       3. G : z -> s로의 변환

% Basic Algorithm
%   1. kernel size만큼 윈도우 결정
%   2. 윈도우 내부에서 히스토그램 평활화 적용
%   3. Stride만큼 중심 픽셀을 이동하여 STEP 1 ~ 2 반복

if size(image, 3) == 3 
    image = rgb2gray(image);
end

[height, width] = size(image);
n = floor(kernelSize/2);
EqualizedImage = zeros([height, width], 'uint8');

for i=1:Stride:height
    if (i <= n) || (i >= (height - n))
        continue
    end
    for j=1:Stride:width
        if (j <= n) || (j >= (width - n))
            continue
        end
        [temp, ~] = histequal(image(i-n:i+n, j-n:j+n), minValue, maxValue);
        EqualizedImage(i-n:i+n, j-n:j+n) = temp; 
    end
end

end

