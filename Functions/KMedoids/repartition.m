function [I, Q] = repartition(D, C, dist)
%REPARTITION reindexes the data to minimize the coherence
%Returns the new indexing and coherence

    k = size(C,2);
    p = size(D,2);
    Q=0;
    I = zeros(1,p);
    for i = 1:p
        d = D(:, i);
        
        bestDist = dist(d,C(:,1));
        cluster = 1;
        for j = 2:k
            newDist = dist(d,C(:,j));
            if(newDist < bestDist)
                bestDist = newDist;
                cluster = j;
            end
        end
        
        I(1,i) = cluster;
        Q = Q + bestDist;
    end
end

