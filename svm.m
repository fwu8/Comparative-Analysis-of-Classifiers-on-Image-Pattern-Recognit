function [ result ] = svm( features, labels, method, model )
% Train a SVM classifer
if strcmp(method, 'train')
    svmStruct = fitcsvm(features',labels',...
        'BoxConstraint',1000,...
        'KernelFunction', 'gaussian');
    result = svmStruct;
elseif strcmp(method, 'test')
    result = predict(model,features');
end
end

