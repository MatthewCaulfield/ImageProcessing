path = "C:\Users\caulf\Desktop\ImageProcessing\HW_Images\hw8\";
skip = imread(path+"skip.png");
messageBlur = imread(path+"message-blur.png");
wordsDegrade = imread(path+"words-degrade.png");
punchCard = imread(path+"punchcard.png");

% figure
% imshow(skip)
% 
% PSF = fspecial('motion',21,11);
% skipBlur = imfilter(skip,PSF,255);
% figure
% imshow(skipBlur)
% imwrite(skipBlur,path+"skipBlur.png");
% 
% figure
% imshow(messageBlur)
% messageNoBlur = deconvwnr(messageBlur,PSF);
% figure
% imshow(messageNoBlur)
% imwrite(messageNoBlur,path+"messageNoBlur.png");
% 
% messageNoBlurSNR = deconvwnr(messageBlur,PSF, 0.00001);
% figure
% imshow(messageNoBlurSNR)
% imwrite(messageNoBlurSNR,path+"messageNoBlurSNR.png");
% 
% snr = 0.001:0.001:0.05;
% for sig2noise = snr
%     wordsNoDegrade = deconvwnr(wordsDegrade,PSF, sig2noise);
%     figure
%     imshow(wordsNoDegrade)
% end
wordsNoDegrade = deconvwnr(wordsDegrade,PSF, 0.007);
imwrite(wordsNoDegrade,path+"wordsNoDegrade.png");

% 
% punchCardBW1 = punchCard>128;
% figure
% imshow(punchCardBW1,[]);
% imwrite(punchCardBW1,path+"punchCardBW128.png");
% 
% [m,n] = size(punchCard);
% noise = randi([-50 50],m,n);
% punchCardBW2 = (double(punchCard) + noise)>128;
% figure
% imshow(punchCardBW2,[]);
% imwrite(punchCardBW2,path+"punchCardBWDither.png");
% 
% bayerMask = 16*[1 9 3 11; 13 5 15 7; 4 12 2 10; 16 8 14 6];
% fun = @(block_struct) block_struct.data + bayerMask;
% punchCardBW3 = blockproc(double(punchCard),[4 4],fun);
% punchCardBW3 = punchCardBW3>256;
% figure
% imshow(punchCardBW3,[]);
% imwrite(punchCardBW3,path+"punchCardBWBayerMask.png");
% 
% punchCardBW4 = dither(punchCard);
% figure
% imshow(punchCardBW4,[]);
% imwrite(punchCardBW4,path+"punchCardBWMatlabDither.png");
