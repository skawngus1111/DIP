function [filtered_image] = HighFrequencyEmphasisFiltering(image, k1, k2, type, D0, n)

if type=="ideal"
    mask = IdealHighPassMaskGenerator(size(image),D0);
elseif type=="butterworth"
    mask = ButterworthHighPassMaskGenerator(size(image), D0, n);
elseif type == "gaussian"
    mask = GaussianHighPassMaskGenerator(size(image), D0);
end

image_fft = fftshift(fft2(double(image)));
filtered_fft = (k1 + k2 * mask) .* image_fft;
filtered_image = uint8(real(ifft2(ifftshift(filtered_fft))));

end

