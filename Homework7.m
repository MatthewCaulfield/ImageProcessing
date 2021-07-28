path = "C:\Users\caulf\Desktop\ImageProcessing\HW_Images\hw7\";
among = imread(path + "among.png");
noise = imread(path + "noise.png");
stripes = imread(path + "stripes.png");
halos = imread(path + "halos.png");

[noiseE1, NoiseE2, NoiseE3, NoiseE4, NoiseE5] =  fiveEntropies(noise);
[stripesE1, stripesE2, stripesE3, stripesE4, stripesE5] =  fiveEntropies(stripes);
[amongE1, amongE2, amongE3, amongE4, amongE5] =  fiveEntropies(among);

im = double(halos);
myjpeg(im,5);
myjpeg(im,8);
halo10 = myjpeg(im,10);
halo25 = myjpeg(im,25);
halo75 = myjpeg(im,75);
imwrite(halo10,path+"halo10.png");
imwrite(halo25,path+"halo25.png");
imwrite(halo75,path+"halo75.png");

function [imageEntropy, horizonAddEntropy, vertAddEntropy, horizonSubEntropy, vertSubEntropy] = fiveEntropies(im)

imVec = double(im(:));
[imLength,~] = size(imVec);
[pixelCount, pixelIntensity] = groupcounts(imVec);
p_i = pixelCount/imLength;
imageEntropy = -sum(p_i.*(log2(p_i)));

imt = im';
imHorizontalVec = double(imt(:));
firstHorizon = imHorizontalVec(1:2:end);
secondHorizon = imHorizontalVec(2:2:end);
horizonAdd = 256*firstHorizon + secondHorizon;
[pixelCount, pixelIntensity] = groupcounts(horizonAdd);
p_i = pixelCount/(imLength/2);
horizonAddEntropy = -sum(p_i.*(log2(p_i)));

firstVert = imVec(1:2:end);
secondVert = imVec(2:2:end);
vertAdd = 256*firstVert+secondVert;
[pixelCount, pixelIntensity] = groupcounts(vertAdd);
p_i = pixelCount/(imLength/2);
vertAddEntropy = -sum(p_i.*(log2(p_i)));

horizonSub = firstHorizon - secondHorizon;
[pixelCount, pixelIntensity] = groupcounts(horizonSub);
p_i = pixelCount/(imLength/2);
horizonSubEntropy = -sum(p_i.*(log2(p_i)));

vertSub = firstVert-secondVert;
[pixelCount, pixelIntensity] = groupcounts(vertSub);
p_i = pixelCount/(imLength/2);
vertSubEntropy = -sum(p_i.*(log2(p_i)));
end

function newIm = myjpeg(im, tau)

if ~isa(im, 'double')||(min(min(im))<0)||(max(max(im))>255)
    display("not correct image format")
end
im = im - 128;
fun = @(block_struct) dct2(block_struct.data);
imTransformed = blockproc(im,[8 8],fun);
imTransformed(abs(imTransformed)<tau) = 0;
fun = @(block_struct) idct2(block_struct.data);
imCompress = blockproc(imTransformed,[8 8],fun);
imCompress = round(imCompress+128);
imCompress(imCompress<0)=0;
imCompress(imCompress>255)=255;
newIm = uint8(imCompress);
figure
imshow(newIm)

end
