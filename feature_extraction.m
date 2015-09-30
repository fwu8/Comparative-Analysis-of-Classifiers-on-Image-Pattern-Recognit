% feature extraction
clc;
clear;
% load xTrainImages(image) and tTrain(label)
load('digittrain_dataset.mat');
load('digittest_dataset.mat');

%% feature extraction
pos_num = 3;
% Training data features
pos_indx = find(tTrain(pos_num,:) == 1);
neg_indx = find(tTrain(pos_num,:) == 0);
train_features = [];
for i = 1:length(pos_indx)
    train_features(:, i) = ...
        extractHOGFeatures(xTrainImages{pos_indx(i)},'CellSize',[10 10]);
end
for i = 1:length(neg_indx)
    train_features(:, i+length(pos_indx)) = ...
        extractHOGFeatures(xTrainImages{neg_indx(i)},'CellSize',[10 10]);
end
train_label = [ones(1, length(pos_indx)), -ones(1, length(neg_indx))];
% Testing data features
pos_indx = find(tTest(pos_num,:) == 1);
neg_indx = find(tTest(pos_num,:) == 0);
test_features = [];
for i = 1:length(pos_indx)
    test_features(:, i) = ...
        extractHOGFeatures(xTestImages{pos_indx(i)},'CellSize',[10 10]);
end
for i = 1:length(neg_indx)
    test_features(:, i+length(pos_indx)) = ...
        extractHOGFeatures(xTestImages{neg_indx(i)},'CellSize',[10 10]);
end
test_label = [ones(1, length(pos_indx)), -ones(1, length(neg_indx))];

%% Training
net = newff(train_features,train_label, [20,1],{'tansig', 'purelin'});
net.trainparam.epochs = 1000;
net.trainparam.goal = 10^-5;
net.trainParam.lr = 10^-1;
net.trainParam.min_grad=1e-10;
net = train(net,train_features,train_label);

%% Testing
predict = sim(net,test_features);
predict = f(predict);
acc = length(find(predict == test_label))/length(predict);