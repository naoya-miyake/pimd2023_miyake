%ex3
rgbImage = imread("peppers.png");

figure(1)
subplot(4,1,1)
imshow(rgbImage)
subplot(4,1,2)
imshow(rgbImage(:,:,1))
subplot(4,1,3)
imshow(rgbImage(:,:,2))
subplot(4,1,4)
imshow(rgbImage(:,:,3))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hsvImage = rgb2hsv(rgbImage); %hsvに変化
figure(2)
subplot(4,1,1)
imshow(rgbImage)
subplot(4,1,2)
imshow(hsvImage(:,:,1))
subplot(4,1,3)
imshow(hsvImage(:,:,2))
subplot(4,1,4)
imshow(hsvImage(:,:,3))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3)
subplot(3,1,1)
imhist(hsvImage(:,:,1)) %ヒストグラムの作成
subplot(3,1,2)
imhist(hsvImage(:,:,2))
subplot(3,1,3)
imhist(hsvImage(:,:,3))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hsvImage_low_s = hsvImage; %コピー
figure(4)
hsvImage_low_s(:,:,2) = hsvImage(:,:,2)/2; %彩度を変化
rgbImage_low_s = hsv2rgb(hsvImage_low_s); %hsv画像をrgb画像に
imshow(rgbImage_low_s)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%しきい値
figure(5)
%色相
channel1Min = 0.953;
channel1Max = 0.043;
BW1 = (hsvImage(:,:,1)) >= (channel1Min);
BW2 = (hsvImage(:,:,1)) <= (channel1Max);
BW_hue = BW1|BW2;
%彩度
channel2Min = 0.344;
BW_sat = (hsvImage(:,:,2)) >= (channel2Min);

BW = BW_hue & BW_sat;
imshow(BW)

figure(6)
maskedrgbImage = (rgbImage .* uint8(BW));
imshow(maskedrgbImage)
