% feature extraction
clc;
clear;
% load xTrainImages(image) and tTrain(label)
load('digittrain_dataset.mat');
load('digittest_dataset.mat');

% train using neural network classifier
one_versus_all_classifier(xTrainImages, tTrain, 'train', 'nn')

% test using neural network classifier
one_versus_all_classifier(xTestImages, tTest, 'test', 'nn')