
k=3;
maxDepth = 1;
D=[zeros(10,5) ones(10,5) -1 * ones(10,5)];
tau = 0.05;

%[I, C] = kMeans(k, D, tau, maxDepth);
d = dMatrix(D, @norm2);
d
[I, cI] = kMedoids_distMatrix(k, d, tau, maxDepth)


I1= [1 1 2 2];
I2= [2 2 1 1];
compareClustering(I1, I2, 2)