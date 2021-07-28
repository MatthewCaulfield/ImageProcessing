function filter = gaussfilt(im, C)
    [m,n] = size(im);
    x1 = 1:m;
    x2 = 1:n;
    [X1, X2] = meshgrid(x2, x1);
    X = [X1(:) X2(:)];
    mu = [ceil(n/2), ceil(m/2)];
    y = mvnpdf(X, mu, C);
    y = reshape(y, m, n);
    y = y/max(max(y));
    filter = ifftshift(y);
end