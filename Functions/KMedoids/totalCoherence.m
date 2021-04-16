function Q = totalCoherence(I, D, C, dist)
%TOTALCOHERENCE sums the coherence of all clusters
    Q = 0;
    for i = 1:size(C,2)
        Q = Q + coherence(D(:, I == i), C(:,i), dist);
    end
end

