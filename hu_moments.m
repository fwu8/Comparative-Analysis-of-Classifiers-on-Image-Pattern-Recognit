function [ h ] = hu_moments( img )
% This function calculate Hu moments of an input image.
u20 = normalized_central_moment(img,2,0);
u02 = normalized_central_moment(img,0,2);
u11 = normalized_central_moment(img,1,1);
u30 = normalized_central_moment(img,3,0);
u12 = normalized_central_moment(img,1,2);
u03 = normalized_central_moment(img,0,3);
u21 = normalized_central_moment(img,2,1);

h1 =  u20 + u02;
h2 = h1^2 + 4*u11^2;
h3 = (u30 - 3*u12)^2 + (u03 - 3*u21)^2;
h4 = (u30 - u12)^2 + (u03 - u21)^2;
h5 = (u30 - 3*u12)*(u30 + u12)*((u30 + u12)^2 - 3*(u21 + u03)^2) + ...
    (3*u21 - u03)*(u21 + u03)*(3*(u30 + u12)^2 - (u21 + u03)^2);
h6 = (u20 - u02)*((u30 + u12)^2 - (u21 + u03)^2) + ...
    4*u11*(u30 + u12)*(u21 + u03);
h7 = (3*u21 - u03)*(u21 + u03)*(3*(u30 + u12)^2 - (u21 + u03)^2) + ...
    (3*u12 - u30)*(u12 + u30)*(3*(u30 + u12)^2 - (u21 + u03)^2);

h = [h1, h2, h3, h4, h5, h6, h7];
end

