%Levent Batakci
%Analyze the data!

%Load Congressional Vote Data
load CongressionalVoteData.mat
I=I+1;% Fix annotation

k=3;
tau=0.05;
maxDepth=5;

%Remove the interesting fella who elected not to vote
del = all(X==0);
X(:, del) = [];
I(:, del) = [];

k=2;
%distMatrix = dMatrix(X, @dissimilarityCardiac); Use to consider absentees
distMatrix = dMatrix(X, @dissimilarityVotes);
[I2, iC2] = kMedoids_distMatrix(k, distMatrix, tau, maxDepth);

X(:,iC2);

%Summary Matrix
evaluateClustering(I,I2,k)

%Show medoids
c1 = X(:, iC2(1,1)); %dem
c2 = X(:, iC2(1,2)); %repub

%Get average distances within groups
Q = zeros(1,k);
n = [nnz(I == 1) nnz(I == 2)];
for i = 1:size(I, 2)
    label = I(1, i);
    if(label == 1) %repub
        rep = iC2(1, 2);
        Q(1, label) = Q(1, label) + distMatrix(i, rep) / n(1, label);
    else %dem
        rep = iC2(1, 1);
        Q(1, label) = Q(1, label) + distMatrix(i, rep) / n(1, label);
        
    end
end
Q

%Show the representative vectors
