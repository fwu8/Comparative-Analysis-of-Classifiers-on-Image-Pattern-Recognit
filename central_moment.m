function [ upq ] = central_moment( img, p, q )
% This function calculate the central moment of input image.
imgSize = 28;
imgArea = imgSize^2;
mx = round(moment(img, 1, 0) / moment(img, 0, 0));
my = round(moment(img, 0, 1) / moment(img, 0, 0));
upq = 0;
for x = 1: imgSize
    for y = 1: imgSize
        if(img(x, y) ~= 0)
            upq = upq + ((x-mx)^p)*((y-my)^q)/imgArea;
        end
    end
end
end

