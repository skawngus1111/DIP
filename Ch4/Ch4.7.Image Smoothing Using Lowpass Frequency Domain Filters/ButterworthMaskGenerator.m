function [mask] = ButterworthMaskGenerator(imageSize,D0,n)
%ButterworthMaskGenerator : Butterworth 저역 주파수 필터링을 위한 마스크를 생성하는 함수
%   Input
%       1. inputSize : 입력 영상의 크기 -> 마스크 영상의 크기를 정하기 위한 입력 파라미터
%       2. D0 : 최대 마스크 값의 50%가 되는 지점
%       3. n : Butterworth 마스크의 차수
%   Output : Butterworth 저역 주파수 필터링을 위한 마스크

width = imageSize(1);
height = imageSize(2);
mask = zeros(width, height);

for i=1:height
    for j=1:width
        D = sqrt((i - (height/2))^2+(j - (width/2))^2);
        denominator = 1 + (D / D0)^(2*n);
        mask(i, j) = 1/denominator;
    end
end
end

