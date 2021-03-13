function [MatchedImage, InverseTargetCDF, TargetCDF] = histMatching(SourceImage, TargetImage, minValue, maxValue)
%histMatching : sourceImage를 targetImage의 히스토그램으로 매칭시키는 함수
%   input 
%       1. sourceImage : 매칭시킬 source 영상
%       2. targetImage : 매칭시킬 target 히스토그램을 가진 영상
%       3. minValue, maxValue : 입력 영상 밝기값의 최솟값과 최댓값

% Basic Algorithm
%   1. source 영상을 히스토그램 평활화적용
%   2. target 영상의 히스토그램 계산
%   3. target 영상에서 평활화된 source 영상의 히스토그램을 갖기 위한 함수 G 계산
%       G(z) = \sum_{j=1}^{k}p_{z}(z_{j})
%   4. G(z) 반올림
%   5. 모호성 문제(ambiguous problem)를 방지하기 위해서 s_{k}의 값 중 가장 가까운 G(z_{q}) 찾기
%   6. STEP 5에서 찾은 s_{k}와 G(z_{k})의 쌍을 이용하여 s_{k} -> z_{q}로 매핑

% STEP 1. source 영상을 히스토그램 평활화적용
[EqualizedSource, SourceCDF] = histequal(SourceImage, minValue, maxValue);

% STEP 2. target 영상의 히스토그램 계산
[width, height] = size(TargetImage); % 입력 영상의 크기
totalPixel = width * height; % 전체 픽셀의 개수
TargetHistogram = im2hist(TargetImage, minValue, maxValue)/totalPixel;% 히스토그램 정규화(0 ~ 1)

% STEP 3. target 영상에서 평활화된 source 영상의 히스토그램을 갖기 위한 함수 G 계산
TargetCDF = zeros(1, maxValue); % 입력 영상 히스토그램의 CDF를 저장할 변수
TargetCDF(1) = TargetHistogram(1);
for i=minValue+1:maxValue % 최솟값 ~ 최댓값까지 각 값에 대한 CDF 계산
    TargetCDF(i) = TargetCDF(i-1) + TargetHistogram(i);
end

% STEP 4. G(z) 반올림
TargetCDF = round((maxValue - 1)*TargetCDF);

% STEP 5. 모호성 문제를 방지하기 위해서 s_{k}의 값 중 가장 가까운 G(z_{q}) 찾기
InverseTargetCDF = zeros(1, maxValue);
for i=minValue:maxValue
    [~, idx] = min(abs(TargetCDF - SourceCDF(i)));
    InverseTargetCDF(i) = idx - 1;
end

% STEP 6. STEP 5에서 찾은 s_{k}와 G(z_{k})의 쌍을 이용하여 s_{k} -> z_{q}로 매핑
MatchedImage = EqualizedSource;

for k=minValue:maxValue
    idx = MatchedImage==(k-1);
    MatchedImage(idx) = InverseTargetCDF(k);
end

end

