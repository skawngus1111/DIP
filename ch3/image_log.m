function [output] = image_log(input, c)
output = c * log(1 + double(input)/255);
end