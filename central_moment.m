function [ upq ] = central_moment( img, p, q )
% This function calculate the central moment of input image.
% Invarient to translation
imgSize = 28;
count = 0;
m00 = moment(img, 0, 0);
m10 = moment(img, 1, 0);
m01 = moment(img, 0, 1);
mx = round( m10/ m00);
my = round( m01/ m00);
upq = 0;
for x = 1: imgSize
    for y = 1: imgSize
        if(img(x, y) ~= 0)
            count = count + 1;
            upq = upq + ((x-mx)^p)*((y-my)^q);
        end
    end
end
upq = upq/count;
end

