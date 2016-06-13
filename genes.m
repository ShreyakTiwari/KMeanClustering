% genes data
A = importdata('/rmt/csfiles/pgrads/mbvb820/matlab/EcoliDatasetCW5810_truncated.txt');

% removing second column as mentioned in exercise
Y = A.textdata;
Y(:,2) = [];

B = (zeros(size(A.data,1),6));

% averaging 3 columns to one as told in exercise

for i = 1:6
    B(:,i) = mean(A.data(:,3*i-2:3*i),2);
end

prompt = 'enter the number of clusters ? ';
k = input(prompt);

prompt = 'enter the method to calculate the distance ? ';
method = input(prompt,'s');

numberOfColumns = size(B,2);
[B , cluster] = knn(B,k,method);

Color = hsv(k);
n = ceil(k/2);
figure
fid=fopen('geneClusteredData.txt','w');
for i=1:k 
    subplot(n,2,i,'replace');
    plot(1:numberOfColumns,B(cluster==i,1:numberOfColumns),'Color',Color(i,:))
     % for writing different cluster data points in file
    %dlmwrite(sprintf('genes%d.txt',i),B(cluster==i,1:numberOfColumns));
    fprintf(fid, '%s \n', Y{(cluster == i)});
end


