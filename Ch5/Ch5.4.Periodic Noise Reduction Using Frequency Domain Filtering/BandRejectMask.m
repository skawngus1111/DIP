function mask = BandRejectMask(image, C0, W)
%BANDREJECTMASK 이 함수의 요약 설명 위치
%   자세한 설명 위치
if size(image, 3) == 3 
    image = rgb2gray(image);
end

[height, width] = size(image); % 입력 영상의 높이와 너비 추출

mask = ones([height, width]);
for i=1:height
    for j=1:width
        D = sqrt((i - height/2)^2 + (j - width/2)^2);
        if (D >= C0 - W/2) && (D <= C0 + W/2)
            mask(i, j) = 0;
        end
    end
end
end

