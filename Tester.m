
k=3;
maxDepth = 1;
D=[zeros(10,5) ones(10,5) -1 * ones(10,5)];
tau = 0.05;

%[I, C] = kMeans(k, D, tau, maxDepth);
[I, cI] = kMedoids(k, D, tau, maxDepth)