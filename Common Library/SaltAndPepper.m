function [im] = SaltAndPepper(im,a,b)
%SALTANDPEPPER 이 함수의 요약 설명 위치
%   자세한 설명 위치
n = numel(im(:,:,1));
m = fix(a*n);
idx = randperm(n, m);

k = fix(b*m);
idx1 = idx(1:k);
idx2 = idx(k+1:end);

idx1 = idx1' + n.*(0:size(im,3)-1);
idx1 = idx1(:);
idx2 = idx2' + n.*(0:size(im,3)-1);
idx2 = idx2(:);

im(idx1) = 255;
im(idx2) = 0;

end

