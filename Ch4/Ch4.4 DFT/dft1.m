function [F] = dft1(sample_value)
%dft1 1차원 데이터에 이산 푸리에 변환을 수행하는 함수
%   sample_value : 샘플링된 함수
M = size(sample_value, 2);
F = zeros(size(sample_value));
% exp(-j2\pi\mu x/M) = cos(2\pi\mu x/M) - jsin(2\pi\mu x/M)
for i=1:size(F, 2)
    for j=1:size(sample_value, 2)
        F(i) = F(i) + sample_value(j) * (cos(2*pi*(i - 1)*(j - 1)/M) - 1i*sin(2*pi*(i - 1)*(j - 1)/M));
    end
end
end