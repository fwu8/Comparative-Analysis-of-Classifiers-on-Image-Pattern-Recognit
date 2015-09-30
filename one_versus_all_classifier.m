function [ ] = one_versus_all_classifier(images, label, method, classifier)
% This function implement one versus all classifier.
% Input:  images - training or testing image
%         label - 10*N matrix, imdicate training or testing image label
%         method - 'train' or 'test'
%         classifier - 'nn' or 'svm'
%
% Output: If method = 'train', execute this function will generate a model
% file, if method = 'test', execute this function will get a confusion
% matrix plot and its accuracy.

% extract feature
features = [];
for i = 1:length(images)
    features(:, i) = ...
        extractHOGFeatures(images{i},'CellSize',[10 10]);
end
if strcmp(method,'train')
    model = {};
    for num = 1:10
        pos_indx = find(label(num,:) == 1);
        neg_indx = find(label(num,:) == 0);
        feature = [features(:, pos_indx), features(:, neg_indx)];
        labels = [ones(1, length(pos_indx)), -ones(1, length(neg_indx))];
        % train model
        if strcmp(classifier, 'nn')
            model{num} = nn(feature, labels, 'train');
        elseif strcmp(classifer,'svm')
            
        end
    end
    % save model
    if strcmp(classifier, 'nn')
        save('nn_model.mat','model');
    elseif strcmp(classifer,'svm')
        
    end
elseif strcmp(method, 'test')
    % load model
    if strcmp(classifier, 'nn')
        load('nn_model.mat');
    elseif strcmp(classifer,'svm')
        
    end
    score = [];
    for num = 1:10
        % test
        if strcmp(classifier, 'nn')
            score(num, :) = nn(features, label, 'test', model{num});
        elseif strcmp(classifer,'svm')
            
        end
    end
    for i = 1:length(images)
        max_score = max(score(:, i));
        score(:, i) = score(:, i) == max_score;
    end
    plotconfusion(label, score);
end
end

