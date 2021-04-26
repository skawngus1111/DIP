function [mask] = IdealMaskGenerate(imageSize, D0)
%UNTITLED 이 함수의 요약 설명 위치
%   자세한 설명 위치
width = imageSize(1);
height = imageSize(2);
mask = zeros(width, height);

for i = 1 : height
    for j = 1 : width
        D = sqrt((i - width/2)^2+(j - height/2)^2);
        if D < D0 
            mask(i, j) = 1;
        end
    end
end
end

