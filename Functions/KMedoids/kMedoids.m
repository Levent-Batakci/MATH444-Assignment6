%Levent Batakci
%2/22/2021
%MATH444 Assignment 2

function [I, cI] = kMedoids(k, D, tau, maxDepth, dist)
%KMEDOIDS is a function that separates the data into
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
    p = size(D,2);

    %Randomize the intitial partition
    I = initIndexing(p, k);
    
    %Randomize the intitial rep. vectors and get the Coherence
    i = 1:p;
    C = datasample(unique(D', 'rows')', k, 2, 'Replace', false);
    lastQ = totalCoherence(I, D, C, dist);

    %Initialize partition
    I = repartition(D, C, dist);
    
    %Choose new Medoids
    [C, Q] = getMedoids(I, D, k, dist);
    t=1;
        
    while abs(Q - lastQ) >= tau
        lastQ = Q;

        %Update partition
        I = repartition(D, C, dist);
    
        %Choose new Medoids
        [C, Q] = getMedoids(I, D, k, dist);
        
        t=t+1;
    end
    
    if(maxDepth >= 1)
        %Check that the code isn't giving a garbage answer
        for j = 1:k
            if(~any(I == j))
                [I, cI] = kMedoids(k, D, tau, maxDepth-1, dist);
                return;
            end
        end
    end
    
    cI = zeros(1, k);
    for i = 1:k
        d = find(D==C(:,i));
        cI(1,i) = floor(d(1)/size(D,1));
    end
    
end

