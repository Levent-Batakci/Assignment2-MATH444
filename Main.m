%Levent Batakci
%Analyze all the data!

%Clear vars
clc
clear

%Load WINE data
load WineData.mat

k=3;
tau=0.05;
maxDepth=5;
%[I, C] = kMeans(k, X, tau, maxDepth, @norm);
I = I';

Xc = X - sum(X,2) / size(X,2) * ones(1, size(X,2));

figure(1)
[U D V] = svd(Xc);
plot(1:13, diag(D), '.', 'MarkerSize', 25); %Only two svs (or just 1) matter

figure(2)
Z2 = [U(:,1) U(:,2)]' * Xc;

distMatrix = norm2Matrix(Xc);
[I1, iC] = kMedoids_distMatrix(k, distMatrix, tau, maxDepth);
k1 = Z2(:, I1 == 1);
k2 = Z2(:, I1 == 2);
k3 = Z2(:, I1 == 3);

hold on
scatter(k1(1,:), k1(2,:),125,'r.')
scatter(k2(1,:), k2(2,:),125,'g.')
scatter(k3(1,:), k3(2,:),125,'b.')
legend("Cluster A","Cluster B","Cluster C");
xlabel("PC 1")
ylabel("PC 2"); 
set(gca,'FontSize', 18);
hold off

%Check for accuracy
figure(3)
k1 = Z2(:, I == 1);
k2 = Z2(:, I == 2);
k3 = Z2(:, I == 3);

hold on
scatter(k1(1,:), k1(2,:),125,'r.')
scatter(k2(1,:), k2(2,:),125,'g.')
scatter(k3(1,:), k3(2,:),125,'b.')
legend("Cultivar 1","Cultivar 2","Cultivar 3")
xlabel("PC 1");
ylabel("PC 2");
set(gca,'FontSize', 18);
hold off

compareClustering(I,I1, k);
evaluateClustering(I,I1,k)

figure(4)
[Im, iC] = kMeans(k, Xc, tau, maxDepth, @norm2);
k1 = Z2(:, Im == 1);
k2 = Z2(:, Im == 2);
k3 = Z2(:, Im == 3);
hold on
scatter(k1(1,:), k1(2,:),125,'r.')
scatter(k2(1,:), k2(2,:),125,'g.')
scatter(k3(1,:), k3(2,:),125,'b.')
legend("Cluster A","Cluster B","Cluster C");
xlabel("PC 1")
ylabel("PC 2"); 
set(gca,'FontSize', 18);
hold off

evaluateClustering(I,Im,k)
%%%

%Load Congressional Vote Data
load CongressionalVoteData.mat
I=I+1;% Fix annotation

%Remove the interesting fella who elected not to vote
del = all(X==0);
X(:, del) = [];
I(:, del) = [];

k=2;
distMatrix = dissimilarityMatrix(X);
[I2, iC2] = kMedoids_distMatrix(k, distMatrix, tau, maxDepth);

X(:,iC2);

compareClustering(I,I2, k);
evaluateClustering(I,I2,k)





