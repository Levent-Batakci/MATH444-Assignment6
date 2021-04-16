function [iC, Q] = getMedoids_distMatrix(I, iC, distMatrix)
%GETMEDOIDS gets all the medoids of the clusters
    k = size(iC,2);
    Q = 0;
    for i = 1:k
        clusterIndices = find(I == i);
        
        minSum = -1;
        medoidIndex = clusterIndices(1,1);
        for j = clusterIndices
            Q_ = sum(distMatrix(j, clusterIndices));
            if(Q_ < minSum || minSum==-1)
                minSum = Q_;
                medoidIndex = j;
            end
        end
        
        iC(1, i) = medoidIndex;
        Q = Q + minSum;
    end
end

