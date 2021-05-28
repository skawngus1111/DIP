function [FilteredImage] = AdaptiveMedianFilter(image,StartWindowSize, MaxWindowSize)
%ADAPTIVEMEDIANFILTER 이 함수의 요약 설명 위치
%   자세한 설명 위치
if size(image, 3) == 3 
    image = rgb2gray(image);
end

n = floor(StartWindowSize/2);
[height, width] = size(image); % 입력 영상의 높이와 너비 추출
FilteredImage = zeros([height, width]); % 입력 영상의 크기에 따라서 스무딩 영상 초기화
image = double(image);
PaddedImage = zeros([height+2*n, width+2*n]);
PaddedImage(n+1:height+n, n+1:width+n) = image;

CurrentWindowSize = StartWindowSize;

for i=n+1:height+n
    for j=n+1:width+n
        % STEP A-1. Extract Local Image and sort by pixel value
%         LocalImage = PaddedImage(i-n:i+n, j-n:j+n);
        SortByValue = ExtractLocalImage(PaddedImage, CurrentWindowSize, i, j, height, width);
%         SortByValue = sort(reshape(LocalImage, [1, CurrentWindowSize^2]));
        
        % STEP A-2. Get min, max, median of Local Image
        zmin = SortByValue(1);
        zmax = SortByValue(end);
        zmed = median(SortByValue);
        zcur = PaddedImage(i, j);
        
        % STEP A-3. Calculate A1 and A2
        A1 = zmed - zmin;
        A2 = zmed - zmax;
        
        % STEP A-4. Check sign of A1 and A2
        if (A1 > 0) && (A2 < 0) % Enter to Level B
            % STEP B-1. Calculate B1 and B2
            B1 = zcur - zmin;
            B2 = zcur - zmax;
            
            % STEP B-2. Check sign of B1 and B2
            if (B1 > 0) && (B2 < 0)
                FilteredImage(i - n, j - n) = zcur;
            else
                FilteredImage(i - n, j - n) = zmed;
            end
        else % Increase the size of window and repeat Level A until size of window is larger than max size window
            CurrentWindowSize = CurrentWindowSize + 2;
            if CurrentWindowSize > MaxWindowSize
                FilteredImage(i - n, j - n) = zmed;
                CurrentWindowSize = StartWindowSize;
            end
        end
    end
end
FilteredImage = uint8(FilteredImage);

end

function LocalImage = ExtractLocalImage(image, WindowSize, i, j, height, width)
cnt = 0;
LocalImage = [];
for si=-floor(WindowSize/2) : floor(WindowSize/2)
    if (i + si) < 1 || (i + si) > height
        continue
    end
    for sj=-floor(WindowSize/2) : floor(WindowSize/2)
        if (j + sj) < 1 || (j + sj) > width
            continue
        end
        cnt = cnt + 1;
        LocalImage = [LocalImage, image(i + si, j + sj)];
    end
end
LocalImage = sort(LocalImage);
end