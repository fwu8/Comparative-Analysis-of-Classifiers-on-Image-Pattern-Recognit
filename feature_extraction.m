% feature extraction
load digittrain_dataset;
% load xTrainImages(image) and tTrain(label)

%imshow(xTrainImages{1});
img = xTrainImages{2};
mx = round(moment(img, 1, 0) / moment(img, 0, 0));
my = round(moment(img, 0, 1) / moment(img, 0, 0));


figure;
imshow(img);

img(mx, my) = 1;
figure;
imshow(img);