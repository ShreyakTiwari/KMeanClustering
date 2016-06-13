function [ B , clust ] = knn( B , k ,method)
% function for K-Means Cluster - Simple k means clustering algorithm
% Input:           1) data where k mean clustering is applied. In this case it is B
%                  2) k : number of clusters to be formed
%                  3) method: which method to use for calculation of distance between
%                     different data points in matrix and centroid eg euclidean, spearman
% Output:          1) matrix B after applying k mean clustering
%                  2) clust: indexing of different cluster
% Local variables: 1) Cprev: previous centroid
%                  2) Cnew: new centroid after calculation
%                  3) g: row vector to store square sum of distances from 
%                     respective centroids of the cluster
%                  4) iteration: local variable used for plotting 
% functions used   1) Centroid: to find new centroid for the clusters
%                  2) distance: to calculate square distance of datapoints from centroid for respective cluster
%                  3) plot: for representing 2d diagram
%                  4) randi: calculation of random  integers 
%              




numberOfColumns = size(B,2);

% create k random points for centroid initially
Cprev = B(randi(size(B,1),k,1),1:numberOfColumns);

% calculate centroid for first time
[ Cnew , B ,clust] = Centroid(B,Cprev,k,method,numberOfColumns);
iteration = 0;    
g = zeros(1,10000);  

%run this loop till new and previous centroid coincides

while (~isequal(Cnew,Cprev))
    iteration = iteration + 1 ;
    Cprev = Cnew;
    [ Cnew , B , clust] = Centroid(B,Cprev,k,method,numberOfColumns);
    g(iteration)  = sum(distance(Cnew,B,k,clust,method,numberOfColumns));    
end



% plot for sum of square of distances w.r.t. iterations
figure
plot((1:iteration) , g(1:iteration));
xlabel('iterations');
ylabel('square distance');
end

