function [HighPassFilter] = ButterworthHighPassMaskGenerator(imageSize,D0,n)

LowPassFilter = ButterworthLowPassMaskGenerator(imageSize, D0, n);
HighPassFilter = 1 - LowPassFilter;
end

