path = "C:\Users\caulf\Desktop\ImageProcessing\HW_Images\hw6\";

vessel = imread(path + "vessels.png");
numSamples = 10;
figure
imshow(vessel)
[XArray, YArray] = ginput(numSamples);
rgbArray = [];
for i = 1:numSamples
    rgbArray = [rgbArray vessel(round(YArray(i)), round(XArray(i)),:)];
end
rgbAvg = mean(rgbArray);

[M,N,~] = size(vessel);
vesselThresh = zeros(M,N);
for x=1:N
    for y = 1:M
        if (rgbAvg(1)-20<vessel(y,x,1))&&(vessel(y,x,1)<rgbAvg(1)+20)&&...
                (rgbAvg(2)-20<vessel(y,x,2))&&(vessel(y,x,2)<rgbAvg(2)+20)...
                &&(rgbAvg(3)-20<vessel(y,x,3))&&(vessel(y,x,2)<rgbAvg(3)+20)
            vesselThresh(y,x) = 255;
        end
        
    end
end
figure 
imshow(vesselThresh)
bwVess = vesselThresh(:,:,1)>50;
se = strel('rectangle',[5, 3]);
BW2 = imerode(bwVess, se);
se = strel('rectangle',[50, 50]);
BW2 = imdilate(BW2, se);
figure
imshow(BW2)
rVessel = regionprops(BW2);
centroids = cat(1,rVessel.Centroid);
figure
imshow(vessel)
hold on
plot(centroids(:,1),centroids(:,2),'g.', 'MarkerSize', 20)

pokemon = imread(path+"pokemon.jpg");
figure
imshow(pokemon)
bw = pokemon(:,:,1)<50;
regions = regionprops(bw, 'Area','Centroid', 'Eccentricity', 'Solidity', 'Circularity');
[m,n] = size(regions);
%%remove all non-pokemon shapes
regions([regions.Area]<500) = [];
[m,n] = size(regions);
labels = bwlabel(bw);
%%2A
regionArea = sort([regions.Area],'descend');
ind = [regions.Area]>=regionArea(5);
centroids = [];
for i = 1:m
    if ind(i) == 1
        centroids = [centroids; regions(i).Centroid]
    end
end
figure
imshow(pokemon)
hold on
plot(centroids(:,1),centroids(:,2), 'g*')
%%2B
regionEcc = sort([regions.Eccentricity],'descend');
ind = [regions.Eccentricity]>=regionEcc(5);
centroids = [];
for i = 1:mx
    if ind(i) == 1
        centroids = [centroids; regions(i).Centroid]
    end
end
figure
imshow(pokemon)
hold on
plot(centroids(:,1),centroids(:,2), 'g*')
%%2C
regionSolid = sort([regions.Solidity],'ascend');
ind = [regions.Solidity]<=regionSolid(5);
centroids = [];
for i = 1:m
    if ind(i) == 1
        centroids = [centroids; regions(i).Centroid]
    end
end
figure
imshow(pokemon)
hold on
plot(centroids(:,1),centroids(:,2), 'g*')
%%2D
regionCirc = sort([regions.Circularity],'descend');
ind = [regions.Circularity]>=regionCirc(5);
centroids = [];
for i = 1:m
    if ind(i) == 1
        centroids = [centroids; regions(i).Centroid]
    end
end
figure
imshow(pokemon)
hold on
plot(centroids(:,1),centroids(:,2), 'g*')

cars = imread(path+"cars.png");
figure
imshow(cars)
carTemp = imread(path+"onecar.png");
figure
imshow(carTemp)
corr = normxcorr2(carTemp, cars);
figure
imshow(corr,[])
colormap('jet')
[ypeak,xpeak] = find(corr>0.7);
yoffSet = ypeak-size(carTemp,1);
xoffSet = xpeak-size(carTemp,2);
figure
imshow(cars)
[m,~] = size(xpeak);
for i = 1:m
    hold on
    rectangle('Position',[xoffSet(i),yoffSet(i), size(carTemp,2),size(carTemp,1)], 'FaceColor',[1 1 0]);
end
[ypeak,xpeak] = find(corr>0.6);
yoffSet = ypeak-size(carTemp,1);
xoffSet = xpeak-size(carTemp,2);
figure
imshow(cars)
[m,~] = size(xpeak);
for i = 1:m
    hold on
    rectangle('Position',[xoffSet(i),yoffSet(i), size(carTemp,2),size(carTemp,1)], 'FaceColor',[1 1 0]);
end
[ypeak,xpeak] = find(corr>0.4);
yoffSet = ypeak-size(carTemp,1);
xoffSet = xpeak-size(carTemp,2);
figure
imshow(cars)
[m,~] = size(xpeak);
for i = 1:m
    hold on
    rectangle('Position',[xoffSet(i),yoffSet(i), size(carTemp,2),size(carTemp,1)], 'FaceColor',[1 1 0]);
end

im1 = rgb2gray(imread(path + "im1.jpg"));
im2 = rgb2gray(imread(path + "im2.jpg"));
im3 = rgb2gray(imread(path + "im3.jpg"));

points1 = detectHarrisFeatures(im1);
points2 = detectHarrisFeatures(im2);
[features1,valid_points1] = extractFeatures(im1,points1);
[features2,valid_points2] = extractFeatures(im2,points2);
indexPairs = matchFeatures(features1,features2);
matchedPoints1 = valid_points1(indexPairs(:,1),:);
matchedPoints2 = valid_points2(indexPairs(:,2),:);
figure; 
showMatchedFeatures(im1,im2,matchedPoints1,matchedPoints2);

points3 = detectHarrisFeatures(im3);
[features3,valid_points3] = extractFeatures(im3,points3);
indexPairs2 = matchFeatures(features1,features3);
matchedPoints3 = valid_points1(indexPairs2(:,1),:);
matchedPoints4 = valid_points3(indexPairs2(:,2),:);
figure; 
showMatchedFeatures(im1,im3,matchedPoints3,matchedPoints4);

points1 = detectSURFFeatures(im1);
points2 = detectSURFFeatures(im3);
[f1,vpts1] = extractFeatures(im1,points1);
[f2,vpts2] = extractFeatures(im3,points2);
indexPairs = matchFeatures(f1,f2) ;
matchedPoints1 = vpts1(indexPairs(:,1));
matchedPoints2 = vpts2(indexPairs(:,2));
figure; showMatchedFeatures(im1,im3,matchedPoints1,matchedPoints2);
legend('matched points 1','matched points 2');
