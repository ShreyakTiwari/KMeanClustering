% dataset for different diseases 

B = importdata('/rmt/csfiles/pgrads/mbvb820/Downloads/3d_filtered_outfile');
labels = importdata('/rmt/csfiles/pgrads/mbvb820/Downloads/labels');

prompt = 'enter the number of clusters ? ';
k = input(prompt);

prompt = 'enter the method to calculate distance ? ';
method = input(prompt,'s');

numberOfColumns = size(B,2);

[B , cluster] = knn(B,k,method);

figure
n = ceil(k/2);
C = hsv(k);
for i=1:k
    
    % subplot for various clusters
    subplot(2,n,i,'replace');
    plot(1:numberOfColumns,B(cluster==i,1:numberOfColumns),'Color',C(i,:))
    
    % for writing different cluster data points in file
    dlmwrite(sprintf('disease%d.txt',i),B(cluster==i,1:numberOfColumns));
end


figure, hold on
for i = 1:k
    % 3d plot for different clusters
    h = scatter3(B(cluster==i,1),B(cluster==i,2),B(cluster==i,3),'MarkerFaceColor',C(i,:));
end
legend('show');
view(3)
saveas(gcf,'plot.png');

x=unique(labels);
figure, hold on
ColorVec = hsv(length(x));
for i = 1:length(x)
    % 3d plot of labels given 
    h = scatter3(B((strcmp(labels,x(i))),1),B((strcmp(labels,x(i))),2),B((strcmp(labels,x(i))),3),'MarkerFaceColor',ColorVec(i,:));
end
legend(x);
view(3)
saveas(gcf,'label.png');

