function [HighPassFilter] = GaussianHighPassMaskGenerator(imageSize, D0)

LowPassFilter = GaussianLowPassMaskGenerator(imageSize, D0);
HighPassFilter = 1 - LowPassFilter;
end

