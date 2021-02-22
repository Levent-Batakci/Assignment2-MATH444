%Levent Batakci
%2/22/2021
%MATH444 Assignment 2

function [I, means] = kMeans(k, D, tau)
%KMEANS is a function that separates the data into
%  k clusters by using alternating optimization.
%This optimization is iterative, and stops when the
%  change in coherence < tau
%
%k = # of clusters
%D = data matrix
%tau = stop tolerance

%Dimensions
[n, p] = size(D);

%Initialize the clustering into equal parts, randomly
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

means = zeros(size(D)); %Initialize centers of mass




end

