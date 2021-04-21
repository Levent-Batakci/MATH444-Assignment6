function [TD, Wi] = WeightTD(A)
[w, N] = size(A);

Wi = zeros(w, 1);
for i = 1:w
    Wi(i) = log(N / nnz(A(i,:)))+1;
end

TD = zeros(size(A));
for j = 1:N
    TD(:, j) = A(:,j) .* Wi;
end
end

