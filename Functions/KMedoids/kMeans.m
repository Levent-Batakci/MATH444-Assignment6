%Levent Batakci
%2/22/2021
%MATH444 Assignment 2

function [I, C] = kMeans(k, D, tau, maxDepth, dist)
%KMEANS is a function that separates the data into
%  k clusters by using alternating optimization.
%This optimization is iterative, and stops when the
%  change in coherence < tau
%
%k = # of clusters
%D = data matrix
%tau = stop tolerance
%
%I = partition
%C = cluster means

    %Number of data pts
    p = size(D,2);

    %Randomize the intitial partition
    I = initIndexing(p, k);
    
    %Get the coherence
    C = zeros(size(D,1), k);
    for i = 1:k
        samples = D(:, I == i);
        C(:,i) = samples(:,1);
    end
    lastQ = totalCoherence(I, D, C, dist);

    %Initialize cluster means
    C = getMeans(I, D, k);

    %Repartition
    [I, Q] = repartition(D, C, dist);
    t=1;
        
    while abs(Q - lastQ) >= tau
        lastQ = Q;

        %Get cluster means
        C = getMeans(I, D, k);

        %Repartition
        [I, Q] = repartition(D, C, dist);
        
        t=t+1;
    end
    
    if(maxDepth >= 1)
        %Check that the code isn't giving a garbage answer
        for j = 1:k
            if(~any(I == j))
                [I, C] = kMeans(k, D, tau, maxDepth-1, dist);
            end
        end
    end
    
end

