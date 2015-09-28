% feature extraction
load digittrain_dataset;
% load xTrainImages(image) and tTrain(label)

%imshow(xTrainImages{1});
img = xTrainImages{2};
hu_moments(img)
