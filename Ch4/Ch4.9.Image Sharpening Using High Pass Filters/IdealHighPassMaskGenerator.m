function [HighPassFilter] = IdealHighPassMaskGenerator(imageSize,D0)

LowPassFilter = IdealLowPassMaskGenerator(imageSize, D0);
HighPassFilter = 1 - LowPassFilter;
end

