function Q = totalCoherence_distMatrix(I, iC, distMatrix)
%TOTALCOHERENCE sums the coherence of all clusters
    Q = 0;
    for i = 1:size(I, 2)
        Q = Q + distMatrix(i, iC(1, I(1, i)));
    end
end

