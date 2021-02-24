function d = dissimilarity(v1,v2)
%DISSIMILARITY calculates the dissimilarity index of two ballots
    d = nnz(v1 ~= v2 && v1 ~= 0 && v2 ~= 0) / nnz(v1 ~= 0 && v2 ~= 0);
end

