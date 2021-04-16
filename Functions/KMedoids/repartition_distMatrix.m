function [I, Q] = repartition_distMatrix(iC, distMatrix)
%REPARTITION reindexes the data to minimize the coherence
%Returns the new indexing and coherence

    k = size(iC,2);
    p = size(distMatrix,2);
    Q=0;
    I = zeros(1,p);
    for i = 1:p
        bestDist = distMatrix(i,iC(1,1));
        cluster = 1;
        for j = 2:k
            newDist = distMatrix(i,iC(1,j));
            if(newDist < bestDist)
                bestDist = newDist;
                cluster = j;
            end
        end
        
        I(1,i) = cluster;
        Q = Q + bestDist;
    end
end

