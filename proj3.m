%load('data644x50.mat');
%load('group1x50.mat');
data = dlmread('C:\Users\Dhanashri\Documents\Sem II\Data Mining\Proj2\ATNT400\ATNTFaceImages400.txt');
X = data(2:end,:);
group = data(1,:);
[~, uniqueGrp] = size(unique(group));    %40
col = size(data); %400
X = X';
Mk = 10;
k = 10;

Kindex = kmeans(X,uniqueGrp,'Replicates',k);
[c, order] = confusionmat(group,Kindex');

a = munkres(-c);
arrangedMatrix = c(:,a);
total = trace(arrangedMatrix);
accuracy = 100*(total/col(2));
disp 'Final Accuracy='
disp(accuracy);
