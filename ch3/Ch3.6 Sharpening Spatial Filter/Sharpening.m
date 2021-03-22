function [SharpeningImage, EdgeImage] = Sharpening(image, type, window)
%UNTITLED9 이 함수의 요약 설명 위치
%   자세한 설명 위치
EdgeImage = LaplacianFiltering(image, type, window);

if type == 'A' || type == 'B'
    SharpeningImage = image + EdgeImage;
elseif type == 'C' || type == 'D'
    SharpeningImage = image - EdgeImage;
end

end

