grayImage = im2double(imread('HW4_einstein.tif'));
fftImage = fft2(grayImage);

magn = abs(fftImage);
magn = log(magn + 1);
ang = angle(fftImage);
subplot(1, 2, 1), imagesc(magn);
title('Magnitude'), set(gca,'xtick',[]), set(gca,'ytick',[]);
subplot(1, 2, 2), imagesc(ang, [-pi pi]);
title('Angle'), set(gca,'xtick',[]), set(gca,'ytick',[]);