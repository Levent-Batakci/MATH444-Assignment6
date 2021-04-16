function [C, Q] = getMedoids(I, D, k, dist)
%GETMEDOIDS gets all the medoids of the clusters
    C = zeros(size(D,1), k);
    Q = 0;
    for i = 1:k
        [C_, Q_] = getMedoid(D(:, I == i), dist);
        C(:, i) = C_;
        Q = Q + Q_;
    end
end

