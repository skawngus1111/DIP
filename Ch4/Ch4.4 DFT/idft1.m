function [f] = idft1(fourier_value)
%idft1 1차원 데이터에 이산 역 푸리에 변환을 수행하는 함수
%   fourier_value : 샘플링된 푸리에 함수
M = size(fourier_value, 2);
f = zeros(size(fourier_value));
% exp(j2\pi\mu x/M) = cos(2\pi\mu x/M) + jsin(2\pi\mu x/M)
for i=1:size(f, 2)
    for j=1:size(fourier_value, 2)
        f(i) = f(i) + fourier_value(j) * (cos(2*pi*(i - 1)*(j - 1)/M) + 1i*sin(2*pi*(i - 1)*(j - 1)/M));
    end
end
f = f / M;
end

