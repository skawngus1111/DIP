function [new, cdf] = histequal(image, minValue, maxValue)
% histequal : 입력 영상에 히스토그램 평활화(Histogram Equalization)을 적용하는 함수
%   input
%       1. image : 입력 영상
%       2. minValue, maxValue : 입력 영상 밝기값의 최솟값과 최댓값
%   output 
%       1. new : 평활화된 영상
%       2. cdf : 입력 영상의 누적확률분포(Cumulative Probability Distribution)

% Basic Algorithm
%     1. 입력 영상의 히스토그램을 얻는다.
%     2. 히스토그램을 정규화한다.(확률화)
%     3. 변환 테이블을 만들기 위해 정규화된 히스토그램으로부터 각 밝기별로 CDF를 계산한다.
%     4. STEP 3을 통해 얻은 변환 테이블을 기반으로 r -> s로의 갱신을 수행한다.

[height,width] = size(image); % 입력 영상의 크기
totalPixel = width * height; % 전체 픽셀의 개수
hist = im2hist(image, minValue, maxValue) / totalPixel; % 히스토그램 정규화(0 ~ 1)

cdf = zeros(1, maxValue); % 입력 영상 히스토그램의 CDF를 저장할 변수

cdf(1) = hist(1);
for i=minValue+1:maxValue % 최솟값 ~ 최댓값까지 각 값에 대한 CDF 계산
    cdf(i) = cdf(i-1) + hist(i);
end

cdf = round((maxValue-1) * cdf);

new = image;

for i = 1:height
    for j = 1:width
        new(i,j) = cdf(image(i,j)+1);
    end
end

end

