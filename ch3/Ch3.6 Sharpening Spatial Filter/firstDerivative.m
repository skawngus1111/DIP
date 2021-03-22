function [firstD] = firstDerivative(data)
%UNTITLED2 이 함수의 요약 설명 위치
%   자세한 설명 위치
firstD = zeros([1, length(data)]);
for i=2:length(data)-1 
    firstD(i) = data(i+1)-data(i);
end
end

