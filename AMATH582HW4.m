%% Make Matrices
test = load('mnist_test.csv');
%Create matrices for test images and labels
newtest = test';
[out2, idx2] = sort(newtest(1,:));
    B = newtest(:, idx2);
test_images = B(2:785,:);
test_labels = B(1,:);

%Create matrices for train images and labels
train = load('mnist_train.csv');
newtrain = train';
    [out, idx] = sort(newtrain(1,:));
    A = newtrain(:, idx);
train_images = A(2:785,:);
train_labels = A(1,:);


%% SVD and PCA

[m,n] = size(train_images);
avg = mean(train_images,2);
train_tilde = train_images-repmat(avg,1,n);

[u1,s1,v1] = svd(train_tilde, 'econ');

lambda1 = diag(s1);

[m2,n2] = size(test_images);
avg2 = mean(test_images,2);
test_tilde = test_images-repmat(avg,1,n2);

[u2,s2,v2] = svd(test_tilde);
lambda2 = diag(s2).;

figure(1)
plot(lambda1, 'redo')
title("Singular Value Plot")
xlabel("Singular Values (Modes)")
ylabel("Energy")

figure(2)
plot(lambda2, 'blacko')

figure(3)
x1 = u1(:,1:52)*s1(1:52,1:52)*v1(:,1:52)';
digit = reshape(x1(:,1), [28,28])';
    imagesc(digit)
    
%% Plot Columns of V

figure(4)
view(3) 
hold on
% 0s
plot3(v1(1:5923,2), v1(1:5923,3),v1(1:5923,5), 'O' )
% 1s
plot3(v1(5924:12665,2), v1(5924:12665,3),v1(5924:12665,5), 'O' )
% 2s
plot3(v1(12666:18623,2), v1(12666:18623,3),v1(12666:18623,5), 'O' )
% 3s
plot3(v1(18624:24753,2), v1(18624:24753,3),v1(18624:24753,5), 'O' )
% 4s
plot3(v1(24754:30596,2), v1(24754:30596,3),v1(24754:30596,5), 'O' )
% 5s
plot3(v1(30597:36017,2), v1(30597:36017,3),v1(30597:36017,5), 'd' )
% 6s
plot3(v1(36018:41935,2), v1(36018:41935,3),v1(36018:41935,5), 'd' )
% 7s
plot3(v1(41936:48200,2), v1(41936:48200,3),v1(41936:48200,5), 'blackd' )
% 8s
plot3(v1(48201:54051,2), v1(48201:54051,3),v1(48201:54051,5), 'd' )
% 9s
plot3(v1(54052:60000,2), v1(54052:60000,3),v1(54052:60000,5), 'd' )
title("Columns of V by Digit")
xlabel("V(:,2)")
ylabel("V(:,3)")
zlabel("V(:,5)")
legend('0','1','2','3','4','5','6','7','8','9')

%% LDA 2 Digits
digits = v1(:,1:55);
testdigits = u1(:,1:55)'*test_tilde;
% fours = digits(:,24754:30596);
% threes = digits(:,18624:24753);
% 
% meanfours = mean(fours,2);
% meanthrees = mean(threes,2);
% 
% Sw = 0; % within class variances
% for k = 1:5843
% Sw = Sw + (fours(:,k) - meanfours)*(fours(:,k) - meanfours)';
% end
% for k = 1:6130
% Sw = Sw + (threes(:,k) - meanthrees)*(threes(:,k) - meanthrees)';
% end
% 
% Sb = (meanfours-meanthrees)*(meanfours-meanthrees)'; % between class
% 
% [V2, D] = eig(Sb,Sw); % linear disciminant analysis
% [lambda, ind] = max(abs(diag(D)));
% w = V2(:,ind);
% w = w/norm(w,2);
% 
% vfours = w'*fours;
% vthrees = w'*threes;
% 
% if mean(vfours) > mean(vthrees)
% w = -w;
% vfours = -vfours;
% vthrees = -vthrees;
% end
% 
% figure(5)
% hold on
% plot(vfours,zeros(5843),'ob','Linewidth',2)
% plot(vthrees,ones(6130),'dr','Linewidth',2)
% title({"LDA for 2 Digits (3 and 4)", ""})
% xlabel("Projection")
% ylabel("Digit (0 for 4, 1 for 3)")

%Test
class = classify(testdigits(:,3148:5139)', digits(18624:30596,:),train_labels(:,18624:30596)');
plot(class, 'greeno')
title({"LDA for 2 Digits (3 and 4)", ""})
xlabel("Projection")
ylabel("Digit (0 for 4, 1 for 3)")

%% LDA 3 digits
class = classify(testdigits(:,1:3147)',digits(1:18623,:),train_labels(:,1:18623)');

figure(6)
plot(class,'o')
title({"LDA for 3 Digits (0, 1, and 2)", ""})
xlabel("Projection")
ylabel("Digits")

%% Easiest and Hardest to separate
%HARD
ind4s = find(train_labels == 4);
ind4stest = find(test_labels == 4);
fours = train_labels(:,24755:30596);
testfours = test_labels(:,4158:5139);
ind9s = find(train_labels == 9);
ind9stest = find(test_labels == 9);
nines = train_labels(:,54052:60000);
testnines = test_labels(:,8992:10000);

test4s9s = testdigits(:,[4158:5139 8992:10000])';
train4s9s = digits([24755:30596 54052:60000],:);
labels4s9s = train_labels(:,[24755:30596 54052:60000])';
classHARD = classify(testdigits(:,[4158:5139 8992:10000])', digits([24755:30596 54052:60000],:),train_labels([24755:30596 54052:60000])');
testlabels4s9s = test_labels(:,[4158:5139 8992:10000])';

results = [];
for i =1:size(classHARD)
    check = classHARD(i,:) - labels4s9s(i,:);
    results = [results; check];
end
   [n,m] = size(results(results==0));
    accuracyHARD = n./1991
    
 % EASY
 ind7s = find(train_labels == 7);
 % 41936:48200
 ind7stest = find(test_labels == 7);
 %6990:8017
 ind8s = find(train_labels == 8);
 %48201:54051
 ind8stest = find(test_labels == 8);
 %8018:8991
 
 test2s7s = testdigits(:,6990:8991)';
 train2s7s = digits(41936:54051,:);
 labels2s7s = train_labels(:,41936:54051)';
 classEASY = classify(test2s7s, train2s7s, labels2s7s);
 testlabels2s7s = test_labels(:,6990:8991)';
 
 resultsEASY = [];
for i =1:size(classEASY)
    check = classEASY(i,:) - testlabels2s7s(i,:);
    resultsEASY = [resultsEASY; check];
end
   [n,m] = size(resultsEASY(resultsEASY==0));
    accuracyEASY = n./2002
    
    %All 10
    class10 = 
    results = [];
for i =1:10000
    check = classHARD(i,:) - labels4s9s(i,:);
    results = [results; check];
end
   [n,m] = size(results(results==0));
    accuracyHARD = n./1991
%% SVM

%All 10
Mdl = fitcecoc(digits,train_labels');
test_labels2 = predict(Mdl,testdigits');
test_labelstranspose = test_labels';
resultsSVM = [];
for i =1:10000
    checkSVM = test_labels2(i) - test_labelstranspose(i);
    resultsSVM = [resultsSVM; checkSVM];
end
     [n,m] = size(resultsSVM(resultsSVM==0));
    accuracySVM10 = n/10000

% SVM classifier with training data, labels and test set
Model = fitcsvm(digits(41936:54051,:),train_labels(:,41936:54051)');
test_labels2 = predict(Model,testdigits(:,6990:8991)');
test_labelstranspose = test_labels(:,6990:8991)';
resultsSVM = [];
for i =1:2002
    checkSVM = test_labels2(i,:) - test_labelstranspose(i,:);
    resultsSVM = [resultsSVM; checkSVM];
end
     [n,m] = size(resultsSVM(resultsSVM==0));
    accuracySVMEasy = n/2002

    % HARD
Mdl = fitcsvm(digits([24755:30596 54052:60000],:),train_labels(:,[24755:30596 54052:60000])');
test_labels2 = predict(Mdl,testdigits(:,[4158:5139 8992:10000])');
test_labelstranspose = test_labels(:,[4158:5139 8992:10000])';
resultsSVM = [];
for i =1:1991
    checkSVM = test_labels2(i,:) - test_labelstranspose(i,:);
    resultsSVM = [resultsSVM; checkSVM];
end
     [n,m] = size(resultsSVM(resultsSVM==0));
    accuracySVMHARD = n/1991

%% Decision Tree

% ALL 10
tree=fitctree(digits,train_labels','MaxNumSplits',40);
tree_testlabels = predict(tree, testdigits');
test_labelstranspose = test_labels';
resultsTREE = [];
for i =1:10000
    checkTREE = tree_testlabels(i,:) - test_labelstranspose(i,:);
    resultsTREE = [resultsTREE; checkTREE];
end
[n,m] = size(resultsTREE(resultsTREE==0));
    accuracyTREE10 = n/10000

% classification tree EASY
tree=fitctree(digits(41936:54051,:),train_labels(:,41936:54051),'MaxNumSplits',10);
tree_testlabels = predict(tree, testdigits(:,6990:8991)');
test_labelstranspose = test_labels(:,6990:8991)';
resultsTREE = [];
for i =1:2002
    checkTREE = tree_testlabels(i,:) - test_labelstranspose(i,:);
    resultsTREE = [resultsTREE; checkTREE];
end
[n,m] = size(resultsTREE(resultsTREE==0));
    accuracyTREEEasy = n/2002
    
    % classification tree HARD
tree=fitctree(digits([24755:30596 54052:60000],:),train_labels(:,[24755:30596 54052:60000])','MaxNumSplits',50);
tree_testlabels = predict(tree, testdigits(:,[4158:5139 8992:10000])');
test_labelstranspose = test_labels(:,[4158:5139 8992:10000])';
resultsTREE = [];
for i =1:1991
    checkTREE = tree_testlabels(i,:) - test_labelstranspose(i,:);
    resultsTREE = [resultsTREE; checkTREE];
end
[n,m] = size(resultsTREE(resultsTREE==0));
    accuracyTREEHARD = n/1991
    
