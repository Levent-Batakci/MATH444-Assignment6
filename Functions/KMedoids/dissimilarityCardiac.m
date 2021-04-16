function d = dissimilarityCardiac(u,v)
%DISSIMILARITY calculates the dissimilarity index of two ballots
    d = nnz(u ~= v) / 22;
end

