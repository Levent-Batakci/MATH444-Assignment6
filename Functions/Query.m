function M = Query(q,data)
%query matching algorithm

[~,p] = size(data);
q = q / norm(q);

M = zeros(1, p);
for j = 1:p
    d = data(:,j);
    M(j) = (q' * d) / norm(d);
end

end

