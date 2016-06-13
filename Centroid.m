function [ Cnew , B , clust2] = Centroid( B,Cprev,k,method,numberOfColumns)
% funtion to create centroid and cluster of data 
% Input:     1) data where k mean clustering is applied. In this case it is B
%            2) k : number of clusters to be formed
%            3) method: which method to use for calculation of distance between
%               different data points in matrix and centroid eg euclidean, spearman
%            4) Cprev: previous centroid for different clusters
% Output:    1) Cnew: new centroid formed for clusters 
%            2) matrix B with cluster index
%            3) clust2: indexing of different data points with cluster
% Functions  1) pdist2: calculation of distance matrix
% used       2) mean: for mean of each row in matrix 
%            3) min: to find minimum of each row and find the index of column number for it   


% calculation of distance matrix
D = pdist2(B(:,1:numberOfColumns),Cprev,method);


% find min for each row and know the column number and assign it to that
% cluster

[~ , clust2] = min(D,[],2);

% adding the cluster number for each data point in 7th column of matrix
B(:,numberOfColumns+1) = clust2;

% preallocation of space for faster operations
Cnew = zeros(k,numberOfColumns);

% finding each row of centroid by taking mean row wise for matrix B clusterwise  
for i=1:k

    Cnew(i,:) = mean(B(clust2==i,1:numberOfColumns));
    
end

end

