%Levent Batakci
%2/22/2021
%MATH444 Assignment 2

function [I, C] = kMeans(k, D, tau)
%KMEANS is a function that separates the data into
%  k clusters by using alternating optimization.
%This optimization is iterative, and stops when the
%  change in coherence < tau
%
%k = # of clusters
%D = data matrix
%tau = stop tolerance
%
%I = partition
%C = cluster means


%Dimensions
[n, p] = size(D);

I = initIndexing(p, k);

%Initialize cluster means
C = zeros(size(D));
for c = 1:k
    C(c) = getMean(D(I == c));
end

%Calculate coherence
Q = totalCoherence(I, D, C);

%Repartition







end

