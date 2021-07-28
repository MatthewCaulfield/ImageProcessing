filePath = "C:\Users\caulf\Desktop\ImageProcessing\HW_Images\HW5_Images";

% %%%Question 1
% kindle = imread(filePath + "\kindles.png");
% imshow(kindle)
% %%%Question 1a
% levelOtsu = graythresh(kindle);
% kindleOtsu = imbinarize(kindle, levelOtsu);
% figure
% imshow(kindleOtsu)
% %%%Quesion 1b
% for level = 0:0.1:0.9
%     level;
%     kindleGlobal = imbinarize(kindle, level);
%     figure
%     imshow(kindleGlobal)
% end
% %%%Question 1c
% fun = @(block_struct)...
%     imbinarize(block_struct.data, (mean(block_struct.data,'all') - 2*std2(block_struct.data))/255);
%    
% kindleBlock = blockproc(kindle,[20 20],fun);
% figure
% imshow(kindleBlock)

%%%Question 2
corn = imread(filePath + "\corn.png");
superpixelsColor(corn, 500)
superpixelsColor(corn, 50)
superpixelsColor(corn, 2000)

function superpixelsColor(im,k)
    [L,N] = superpixels(im,k);
    figure
    BW = boundarymask(L);
    imshow(imoverlay(im,BW,'cyan'),'InitialMagnification',67)
    outputImage = zeros(size(im),'like',im);
    idx = label2idx(L);
    numRows = size(im,1);
    numCols = size(im,2);
    for labelVal = 1:N
        redIdx = idx{labelVal};
        greenIdx = idx{labelVal}+numRows*numCols;
        blueIdx = idx{labelVal}+2*numRows*numCols;
        outputImage(redIdx) = mean(im(redIdx));
        outputImage(greenIdx) = mean(im(greenIdx));
        outputImage(blueIdx) = mean(im(blueIdx));
    end    

    figure
    imshow(outputImage,'InitialMagnification',67)
end

%%%Question 3
