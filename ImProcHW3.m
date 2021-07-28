path = "C:/Users/caulf/Desktop/ImageProcessing/HW_Images/hw3/";

%%%Code for Q1
hunters = imread(path + "hunters.png");
figure
imshow(hunters, [])

filter1 = ones(5)/25;
hunters1A = imfilter(hunters,filter1);
figure
imshow(hunters1A)


hunters1B = medfilt2(hunters,[5 5]);
figure
imshow(hunters1B)


%%%Code for Q2
vacuum = imread(path+"vacuum.png");
figure
imshow(vacuum,[])

vacuum2A = imfilter(vacuum, filter1);
figure
imshow(vacuum2A)

for k = 1:5
    vacuum2B = vacuum + k*(vacuum-vacuum2A);
    figure
    imshow(vacuum2B, [0, 255])
end

%% Q4
building = imread(path + "building.png");
figure
imshow(building)

fftshow(building)

filter4b = boxfilt(building, 31, 31);
figure
imshow(fftshift(filter4b))

building4C = freqflt(building, filter4b);
figure
imshow(building4C)

filter4d = boxfilt(building, 91, 91);
figure
imshow(fftshift(filter4d))

building4d = freqflt(building, filter4d);
figure
imshow(building4d)

filter4e = boxfilt(building, 91, 31);
figure
imshow(fftshift(filter4e))

building4e = freqflt(building, filter4e);
figure
imshow(building4e)

filter4f = boxfilt(building, 91, 479);
figure
imshow(fftshift(filter4f))

building4f = freqflt(building, filter4f);
figure
imshow(building4f)

filter4g = boxfilt(building, 597, 31);
figure
imshow(fftshift(filter4g))

building4g = freqflt(building, filter4g);
figure
imshow(building4g)

%%% Question 5
filter5A = gaussfilt(building, [100 0; 0 100]);
figure
imshow(fftshift(filter5A), [])

building5b = freqflt(building, filter5A);
figure
imshow(building5b)

fftshow(building5b)

filter5D = gaussfilt(building, [900 0; 0 900]);

building5d = freqflt(building, filter5D);
figure
imshow(building5d)

filter5E = gaussfilt(building, [900 0; 0 100]);

building5e = freqflt(building, filter5E);
figure
imshow(building5e)
