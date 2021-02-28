function distMatrix = norm2Matrix(X)
%DISSIMILARITY matrix
    p = size(X,2);
    distMatrix = zeros(p,p);
    for i = 1:p
        distMatrix(i,i) = 0;
        for j = i+1:p
            distMatrix(i,j) = norm2(X(:, i), X(:, j));
            distMatrix(j,i) = distMatrix(i,j);
        end
    end
end

