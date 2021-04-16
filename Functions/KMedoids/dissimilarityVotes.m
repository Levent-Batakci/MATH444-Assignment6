function d = dissimilarityVotes(u,v)
%DISSIMILARITY calculates the dissimilarity index of two ballots
    if(nnz(u ~= 0 & v ~= 0) == 0)
        d = 1/2;
    else
        d = nnz(u ~= v & u ~= 0 & v ~= 0) / nnz(u ~= 0 & v ~= 0);
    end    
end

