function [ mpq ] = moment( img, p, q )
% This function get the moment with order (p, q) of an image.
% Input: 28 x 28 image, order p, order q.
% Output moment with order (p, q).
imgSize = 28;
mpq = 0;
for x = 1: imgSize
    for y = 1: imgSize
        if(img(x, y) ~= 0)
            mpq = mpq + (x^p)*(y^q);
        end
    end
end
mpq = mpq / (imgSize * imgSize);
end

