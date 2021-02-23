function C = getMeans(I, D, k)
%GETMEANS Summary of this function goes here
%   Detailed explanation goes here
    C = zeros(size(D,1), k);
    for c = 1:k
        C(:, c) = getMean(D(:, I == c));
    end
end

