function [reject_image] = HPF(image,D0,type,n)
%UNTITLED7 이 함수의 요약 설명 위치
%   자세한 설명 위치
if type=="ideal"
    mask = IdealHighPassMaskGenerator(size(image),D0);
elseif type=="butterworth"
    mask = ButterworthHighPassMaskGenerator(size(image), D0, n);
elseif type == "gaussian"
    mask = GaussianHighPassMaskGenerator(size(image), D0);
end
image_fft = fftshift(fft2(double(image)));
reject_image_fft = image_fft .* mask;
reject_image = uint8(real(ifft2(ifftshift(reject_image_fft))));

end
