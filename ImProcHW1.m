close all
%Problem 1A
imA = uint8(60+zeros(500, 500));
figure
imshow(imA,[0 255])
% %Problem 1B
imB = zeros(500, 500);
imB(:, 1:4:500) = 255;
imB(:, 2:4:500) = 255;
figure
imshow(imB, [0 255])
% %Problem 1C
imC = zeros(500, 500);
imC(:,1:250) = 32;
imC(:,1:250) = 200;
figure
imshow(imC, [0 255])
% %Problem 1D
x = [1:500];
x = x/2;
imD = uint8(repmat(x, 500, 1));
figure
imshow(imD, [0 255])
%Problem 1E
x = 1:500;
y = [1:500]';
imE = uint8(255*exp(-((x-64).^2+(y-64).^2)/200^2));
figure
imshow(imE, [0 255])
%Problem 1F
imF = ones(500,500,3);
imF(1:250,1:250,:) = 255;
imF(251:500, 1:250,1) = 255; imF(251:500, 1:250,3) = 255;
imF(1:250, 251:500, 2:3) = 255;
imF(251:500, 251:500,3) = 255;
imF = uint8(imF);
figure
imshow(imF, [0 255])
%Question 3
grey128 = uint8(round(imE/2));
figure
imshow(grey128, [])
grey64 = uint8(round(imE/4));
figure
imshow(grey64, [])
grey32 = uint8(round(imE/8));
figure
imshow(grey32, [])
grey16 = uint8(round(imE/16));
figure
imshow(grey16, [])

