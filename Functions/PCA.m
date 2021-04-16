function [Z, U] = PCA(X)
%Returns the results of the PCA on X
%Centers X.
%Tolerance should be between 0 and 1, ideally close to 0.

[~,p] = size(X);

Xc = X - sum(X,2) / p;

[U,V,~] = svd(Xc);

Z = U' * X;

end

