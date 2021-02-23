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
    p = size(D,2);

    %Randomize the intitial partition
    I = initIndexing(p, k);

    %Get the coherence
    C = zeros(size(D,1), k);
    lastQ = totalCoherence(I, D, C, @norm);

    %Initialize cluster means
    C = getMeans(I, D, k);

    %Repartition
    [I, Q] = repartition(D, C, @norm);

    while abs(Q - lastQ) >= tau
        lastQ = Q;

        %Get cluster means
        C = getMeans(I, D, k);

        %Repartition
        [I, Q] = repartition(D, C, @norm);
    end
end

