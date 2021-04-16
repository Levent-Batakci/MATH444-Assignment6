function I = initIndexing(p, k)
%INITINDEXING Initializes the clustering into equal parts, randomly
    z = floor(p/k);
    leftOver = p - z*k;

    I = zeros(1,p);
    for i = 1:k-leftOver
        I(1, z*(i-1)+1:z*i) = i;
    end
    endPt = z*(k-leftOver);
    endK = k-leftOver;
    for i = endK+1:k
        s= endPt+1 + (i-endK-1)*(z+1);
        f= endPt+1 + (i-endK)*(z+1)-1;
        I(1, s:f) = i;
    end
    I = I(:, randperm(p));
end

