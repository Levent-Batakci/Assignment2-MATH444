function Q = coherence(D, rep, dist)
%COHERENCE calculates the coherence of the data D
%   with representative vector rep, using measure dist
    
    Q = 0;
    for i = 1: numel(D)
        Q = Q + dist(D(:,i)-rep);
    end
end

