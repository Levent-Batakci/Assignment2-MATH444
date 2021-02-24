%Levent Batakci
%Analyze all the data!

%Clear vars
clc
clear

%Load data
load WineData.mat

k=3;
tau=1;
maxDepth=5;
[I, C] = kMeans(k, X, tau, maxDepth);

figure(1)
[U D V] = svd(X, 'eco');
plot(1:13, diag(D), '.', 'MarkerSize', 25); %Only two svs (or just 1) matter

figure(2)
Z2 = [U(:,1) U(:,2)]' * X;
[I_, C] = kMedoids(k, Z2, tau, maxDepth);
k1 = Z2(:, I_ == 1);
k2 = Z2(:, I_ == 2);
k3 = Z2(:, I_ == 3);

hold on
scatter(k1(1,:), k1(2,:),100,'r.')
scatter(k2(1,:), k2(2,:),100,'g.')
scatter(k3(1,:), k3(2,:),100,'b.')
hold off

%Check for accuracy
figure(3)
k1 = Z2(:, I == 1);
k2 = Z2(:, I == 2);
k3 = Z2(:, I == 3);

hold on
scatter(k1(1,:), k1(2,:),100,'r.')
scatter(k2(1,:), k2(2,:),100,'g.')
scatter(k3(1,:), k3(2,:),100,'b.')
hold off

compareClustering(I,I_, k)