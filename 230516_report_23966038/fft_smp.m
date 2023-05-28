%ex7
I = imread('coins.png');
figure(1)
DP = fftshift(fft2(I));
imagesc(abs(DP))
axis image