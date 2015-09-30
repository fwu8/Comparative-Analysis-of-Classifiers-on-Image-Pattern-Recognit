function [ output ] = f( input )
% threshood function
output = input;
[m, n] = size(output);
for i = 1:m
    for j = 1:n
        if(output(i,j) >= 0)
            output(i,j) = 1;
        else
            output(i,j) = -1;
        end
    end
end
end

