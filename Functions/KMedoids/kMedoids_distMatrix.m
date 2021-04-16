%Levent Batakci
%2/22/2021
%MATH444 Assignment 2

function [I, iC] = kMedoids_distMatrix(k, distMatrix, tau, maxDepth)
%KMEDOIDS_DISTMATRIX is a function that separates the data into
%  k clusters by using alternating optimization.
%This optimization is iterative, and stops when the
%  change in coherence < tau
%
%Unlike with kMeans, the representative vectors are
%  from of the data in this version
%k = # of clusters
%D = data matrix
%tau = stop tolerance
%
%I = partition
%C = cluster means

    %Number of data pts
    p = size(distMatrix,2);

    %Randomize the intitial partition
    I = initIndexing(p, k);
    
    %Randomize the intitial rep. vectors and get the Coherence
    i = 1:p;
    iC = datasample(i, k, 2, 'Replace', false);
    lastQ = totalCoherence_distMatrix(I, iC, distMatrix);

    %Initialize partition
    I = repartition_distMatrix(iC, distMatrix);
    
    %Choose new Medoids
    [iC, Q] = getMedoids_distMatrix(I, iC, distMatrix);
    t=1;
        
    while abs(Q - lastQ) >= tau
        lastQ = Q;

        %Update partition
        I = repartition_distMatrix(iC, distMatrix);
        Q = totalCoherence_distMatrix(I, iC, distMatrix);
        
        %Choose new Medoids
        iC = getMedoids_distMatrix(I, iC, distMatrix);
        Q = totalCoherence_distMatrix(I, iC, distMatrix);
        
        t=t+1;
    end
    
    if(maxDepth >= 1)
        %Check that the code isn't giving a garbage answer
        for j = 1:k
            if(~any(I == j))
                [I, iC] = kMedoids_distMatrix(k, distMatrix, tau, maxDepth-1);
                return;
            end
        end
    end
end

