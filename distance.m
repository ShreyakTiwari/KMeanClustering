function [ g ] = distance( Cnew, B ,k,clust,method,numberOfColumns)
% calculate the square of the distance of each element from centroid of their respective
% cluster

%pre allocate vector
g = zeros(1,k);

for i=1:k
    % find square distance of each row of cluster from its respective centroid
    g(i) = sum(pdist2(B(clust==i,1:numberOfColumns),Cnew(i,:),method).^2);    
end

end

