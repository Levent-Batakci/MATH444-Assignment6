function [C, Q] = getMedoid(D, dist)
%GETMEDOIDS gets medoid of the given data
    Q = coherence(D, D(:,1), dist);
    Qi = 1;
    for i = 2:size(D,2)
        newQ = coherence(D, D(:, i), dist);
        if(newQ < Q)
            Q = newQ;
            Qi = i;
        end
    end
  
    C = D(:,Qi);
end

