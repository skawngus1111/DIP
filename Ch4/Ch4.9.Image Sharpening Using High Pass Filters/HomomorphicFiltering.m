function [filtered_image] = HomomorphicFiltering(image, D0, gammaL, gammaH, type,n)

if type=="ideal"
    mask = IdealHighPassMaskGenerator(size(image),D0);
elseif type=="butterworth"
    mask = ButterworthHighPassMaskGenerator(size(image), D0, n);
elseif type == "gaussian"
    mask = GaussianHighPassMaskGenerator(size(image), D0);
end
mask = (gammaH - gammaL) * mask + gammaL;

ln_image = log(1 + double(image)); % image -> ln(image)
ln_image_fft = fftshift(fft2(ln_image)); % ln(image) -> fft(ln(image))
ln_filtered_image_fft = mask .* ln_image_fft; % fft(ln(image)) -> fft(ln(image)) * mask
ln_filtered_image = real(ifft2(ifftshift(ln_filtered_image_fft))); % fft(ln(image)) * mask -> real(ifft(fft(ln(image)) * mask))
filtered_image = uint8(exp(ln_filtered_image)); % real(ifft(fft(ln(image)) * mask)) -> exp(real(ifft(fft(ln(image)) * mask)))

end
