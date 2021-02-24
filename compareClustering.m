function Accuracy = compareClustering(I, clustering, k)
%COMPARECLUSTERING returns the respective accuracies of the
%   clustering
%That is, a vector of accuracies is returned, where the i-th
%   entry is the percentage of entries annotated as being in
%   group i that are correctly clustered

    %Note that the labeling of the clustering is non-unique
    %This means that we need to figure out how the labels match up
    Accuracy = zeros(1,k);
    rep = zeros(1,k);
    for i = 1:k
        group = clustering(I==i);
        rep(1,i) = mode(group);
        Accuracy(1, i) = nnz((group==rep(1,i))) / numel(group);
    end
    
    if(numel(unique(rep)) ~= k)
        disp("Error in comparison mapping!");
    end

    
end

