% feature extraction
load digittrain_dataset;
% load xTrainImages(image) and tTrain(label)

%imshow(xTrainImages{1});
img = xTrainImages{2};
central_moment(img, 2, 2)
