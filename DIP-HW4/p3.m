grayImage = im2double(imread('HW4_einstein.tif'));
[M, N] = size(grayImage);
cutoff_1 = 20;
cutoff_2 = 50;

fftImage = fft2(grayImage);
H = p3_lpfilter('gaussian', M, N, cutoff_1);
G = H.*fftImage;
g = real(ifft2(G));
subplot(2, 2, 1), imagesc(g, [0, 1]), colormap(gray);
title('Cutoff = 20 no padding'), set(gca,'xtick',[]), set(gca,'ytick',[]);
H = p3_lpfilter('gaussian', M, N, cutoff_2);
G = H.*fftImage;
g = real(ifft2(G));
subplot(2, 2, 3), imagesc(g, [0, 1]), colormap(gray);
title('Cutoff = 50 no padding'), set(gca,'xtick',[]), set(gca,'ytick',[]);



paddedImage = zeros(1200, 980);
paddedImage(1:600, 1:490) = grayImage;
[M, N] = size(paddedImage);

fftImage = fft2(paddedImage);
H = p3_lpfilter('gaussian', M, N, cutoff_1);
G = H.*fftImage;
g = real(ifft2(G));
subplot(2, 2, 2), imagesc(g(1:600, 1:490), [0, 1]), colormap(gray);
title('Cutoff = 20 with padding'), set(gca,'xtick',[]), set(gca,'ytick',[]);
H = p3_lpfilter('gaussian', M, N, cutoff_2);
G = H.*fftImage;
g = real(ifft2(G));
subplot(2, 2, 4), imagesc(g(1:600, 1:490), [0, 1]), colormap(gray);
title('Cutoff = 50 with padding'), set(gca,'xtick',[]), set(gca,'ytick',[]);