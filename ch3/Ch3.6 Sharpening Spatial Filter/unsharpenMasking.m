function [unsharpenImage, SmoothImage, diffImage] = unsharpenMasking(image, window, factor)
%UNTITLED10 이 함수의 요약 설명 위치
%   자세한 설명 위치

SmoothImage = BoxFilterForLoop(image, window);
diffImage = image - SmoothImage;
unsharpenImage = image + factor * diffImage;

end

