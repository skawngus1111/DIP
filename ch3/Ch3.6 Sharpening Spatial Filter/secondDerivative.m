function [secondD] = secondDerivative(data)
%UNTITLED3 이 함수의 요약 설명 위치
%   자세한 설명 위치
secondD = zeros([1, length(data)]);
for i=2:length(data)-1 
    secondD(i) = data(i+1)+data(i-1)-2*data(i);
end
end

