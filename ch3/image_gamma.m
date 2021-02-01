function [output] = image_gamma(input, gamma, c)
output = im2uint8(c*im2double(input).^(1/gamma));
end

