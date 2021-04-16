function AccMatrix = evaluateClustering(I, clustering, k)
%COMPARECLUSTERING returns clustering results matrix

    AccMatrix = zeros(k,k);
    for i =1:k
        for j =1:k
            AccMatrix(i,j) = nnz(clustering(I==i)==j);
        end
    end

    
end

