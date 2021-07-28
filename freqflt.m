function filtered_im = freqflt(im, filter)
    DFT_im = fft2(im);
    filtered_im = DFT_im.*filter;
    filtered_im = ifft2(filtered_im);
    filtered_im = uint8(real(filtered_im));
end