function D = dMatrix(X, dist)
%DMATRIX Summary of this function goes here
%   Detailed explanation goes here
    p = size(X,2);
    D = zeros(p,p);
    for i = 1:p
        D(i,i) = 0;
        for j = i+1:p
            D(i,j) = dist(X(:, i), X(:, j));
            D(j,i) = D(i,j);
        end
    end
end

