mystery = imread('prophecy.png');
figure
imshow(mystery)
figure
histeq(mystery)
fun = @(block_struct) histeq(block_struct.data);
mysteryBlock = blockproc(mystery, [80 80], fun);
figure
imshow(mysteryBlock)
