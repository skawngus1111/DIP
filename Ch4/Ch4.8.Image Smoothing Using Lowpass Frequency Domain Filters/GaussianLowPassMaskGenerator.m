function [mask] = GaussianLowPassMaskGenerator(imageSize,D0)
%GaussianMaskGenerator : Gaussian 저역 주파수 필터링을 위한 마스크를 생성하는 함수
%   Input
%       1. inputSize : 입력 영상의 크기 -> 마스크 영상의 크기를 정하기 위한 입력 파라미터
%       2. D0 : 대역 차단을 위한 범위 -> 분산(variance)와 동일한 역
%   Output : Gaussian 저역 주파수 필터링을 위한 마스크

width = imageSize(1);
height = imageSize(2);
mask = zeros(width, height);

for i=1:width
    for j=1:height
        D = sqrt((i - (width/2))^2+(j - (height/2))^2);
        expoValue = -D^2/(2*D0^2);
        mask(i, j) = exp(expoValue);
    end
end
end

