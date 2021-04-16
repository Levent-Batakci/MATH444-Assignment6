function C = getMeans(I, D, k)
%GETMEANS Gets all the centers of mass of the clusters
    C = zeros(size(D,1), k);
    for c = 1:k
        C(:, c) = getMean(D(:, I == c));
    end
end

