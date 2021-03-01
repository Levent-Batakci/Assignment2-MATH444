%Levent Batakci
%Analyze the data!

%Clear vars
clc
clear all

%Load WINE data
load WineData.mat
I = I';

k=3;
tau=0.05;
maxDepth=5;

%Compute the SVD
Xc = X - sum(X,2) / size(X,2) * ones(1, size(X,2));
[U, D, V] = svd(X);
Z2 = [U(:,1) U(:,2)]' * X; %First two PCs of the centered data

figure(1) %Plot the singular values
plot(1:13, diag(D), '.', 'MarkerSize', 25); %Only two svs (or just 1) matter

%Plot the annotation of the data
figure(2)
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
sgtitle("Correct Grouping of the Data", 'FontSize', 20)
hold off

%Cluster using kMedoids
%Plot the clustering via the first two PCs
figure(3)
distMatrix = dMatrix(X, @norm2);
[I1, iC] = kMedoids_distMatrix(k, distMatrix, tau, maxDepth);
k1 = Z2(:, I1 == 1);
k2 = Z2(:, I1 == 2);
k3 = Z2(:, I1 == 3);

hold on
scatter(k1(1,:), k1(2,:),125,'r.')
scatter(k2(1,:), k2(2,:),125,'g.')
scatter(k3(1,:), k3(2,:),125,'b.')
scatter(Z2(1,iC(1,1)), Z2(2,iC(1,1)),150,'ks')
scatter(Z2(1,iC(1,2)), Z2(2,iC(1,2)),150,'ks')
scatter(Z2(1,iC(1,3)), Z2(2,iC(1,3)),150,'ks')
legend("Cluster A","Cluster B","Cluster C");
xlabel("PC 1")
ylabel("PC 2"); 
set(gca,'FontSize', 18);
sgtitle("Clustering Given by kMedoids", 'FontSize', 20)
hold off

disp("Clustering Matrix for kMedoids");
M = evaluateClustering(I,I1,k)
disp(" ");

%Cluster using kMeans
%Plot the clustering via the first two PCs
figure(4)
[Im, C] = kMeans(k, X, tau, maxDepth, @norm2);
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
sgtitle("Clustering Given by kMeans", 'FontSize', 20)
hold off

disp("Clustering Matrix for kMeans");
M = evaluateClustering(I,Im,k)
disp(" ");
%%%




