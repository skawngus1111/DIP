function [MatchedImage, GInverse, G] = histMatching(SourceImage, TargetImage, minValue, maxValue)
%histMatching : sourceImage를 targetImage의 히스토그램으로 매칭시키는 함수
%   input 
%       1. sourceImage : 매칭시킬 source 영상
%       2. targetImage : 매칭시킬 target 히스토그램을 가진 영상
%       3. minValue, maxValue : 입력 영상 밝기값의 최솟값과 최댓값
%   output
%       1. MatchedImage : target 영상을 이용해서 source 영상을 매칭시킨 출력 영상
%       2. GInverse : s -> z로 변환하는 G의 역변환
%       3. G : z -> s로의 변환

% Basic Algorithm
%   1. source 영상을 히스토그램 평활화적용
%   2. target 영상에서 평활화된 source 영상의 히스토그램을 갖기 위한 함수 G 계산
%       G(z) = \sum_{j=1}^{k}p_{z}(z_{j})
%   3. 모호성 문제(ambiguous problem)를 방지하기 위해서 s_{k}의 값 중 가장 가까운 G(z_{q}) 찾기
%   4. STEP 3에서 찾은 s_{k}와 G(z_{k})의 쌍을 이용하여 s_{k} -> z_{q}로 매핑

% STEP 1. source 영상(r)을 히스토그램 평활화 적용(s) : r -> s
[~, T] = histequal(SourceImage, minValue, maxValue);

% STEP 2. target 영상에서 평활화된 source 영상의 히스토그램을 갖기 위한 함수 G 계산
[~, G] = histequal(TargetImage, minValue, maxValue);

% STEP 3. 모호성 문제를 방지하기 위해서 s_{k}의 값 중 가장 가까운 G(z_{q}) 찾기
GInverse = zeros(1, maxValue);

for i=1:maxValue
    diff = abs(T(i) - G);
    [~, idx] = min(diff);
    GInverse(i) = idx - 1;
end


% STEP 4. STEP 3에서 찾은 s_{k}와 G(z_{k})의 쌍을 이용하여 s_{k} -> z_{q}로 매핑
MatchedImage = zeros([size(SourceImage, 1), size(SourceImage, 2)], 'uint8');

for i=1:size(SourceImage, 1)
    for j=1:size(SourceImage, 2)
        MatchedImage(i, j) = GInverse(SourceImage(i, j) + 1);
    end
end

end

