function [sharpen_image, laplacian_image] = LaplacianFiltering(image)

[width,height] = size(image);
mask = zeros([width, height]);

for i=1:width
    for j=1:height
        distance = sqrt((j - height/2)^2 + (i - width/2)^2);
        mask(i, j) = -4*(pi^2)*(distance^2);
    end
end

image_fft = fftshift(fft2(double(image)));
laplacian_image = real(ifft2(ifftshift(image_fft .* mask)));
laplacian_image = uint8(laplacian_image ./ max(laplacian_image, [], 'all'));
sharpen_image = image - laplacian_image;

end

