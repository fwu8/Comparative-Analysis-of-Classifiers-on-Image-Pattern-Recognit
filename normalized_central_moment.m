function [ eta_pq ] = normalized_central_moment( img, p, q )
% This function calculate the normalized central moment of input image.
% Invarient to translation and scale change
r = (p + q + 2) / 2;
eta_pq = central_moment(img, p, q)/(central_moment(img, 0, 0)^r);
end

