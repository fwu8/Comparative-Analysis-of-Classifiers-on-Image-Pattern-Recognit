% feature extraction
load digittrain_dataset;
% load xTrainImages(image) and tTrain(label)

%imshow(xTrainImages{1});
img = xTrainImages{3};
hu_moments(img)
[xTestImages, tTest] = digittest_dataset;
save('digittest_dataset', 'xTestImages', 'tTest');
