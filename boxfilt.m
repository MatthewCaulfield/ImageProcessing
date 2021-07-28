function filter = boxfilt(im, w, h)
    [m,n] = size(im);
    filter = zeros(m,n);
    filter(1:ceil(w/2), 1:ceil(h/2)) = 1;
    filter(1:ceil(w/2), n-floor(h/2):n) = 1;
    filter(m-floor(w/2):m, 1:ceil(h/2)) = 1;
    filter(m-floor(w/2):m, n-floor(h/2):n) = 1;
end