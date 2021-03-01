%Levent Batakci
%Analyze the data!

%Clear vars
clc
clear all

k=3;
tau=0.05;
maxDepth=5;

%Load Cardiac Data
load CardiacSPECT.mat
I=I+1; %Fix the annotation

k=2;
distMatrix = dMatrix(X, @dissimilarityCardiac);
[I2, iC2] = kMedoids_distMatrix(k, distMatrix, tau, maxDepth);

X(:,iC2);

evaluateClustering(I,I2,k)

%Show the representative vectors
