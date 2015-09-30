function [ result ] = nn( features, labels, method, net )
% Train a neural network classifer
if strcmp(method, 'train')
    net = newff(features,labels, 20,{'tansig', 'purelin'});
    net.trainparam.epochs = 1000;
    net.trainparam.goal = 10^-5;
    net.trainParam.lr = 10^-1;
    net.trainParam.min_grad=1e-10;
    net = train(net,features,labels);
    result = net;
elseif strcmp(method, 'test')
    result = sim(net,features);
end
end

