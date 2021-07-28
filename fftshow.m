function fftshow(im)
    fft_im = fft2(im);
    fft_im_shifted=fftshift(log(fft_im));
    %fft_im_shifted = (fft_im_shifted);
    figure
    imshow(fft_im_shifted, [])
end