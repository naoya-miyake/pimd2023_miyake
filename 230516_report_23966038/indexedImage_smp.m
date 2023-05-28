%ex4
info1980 = imfinfo("Image1980.png");
type1980=info1980.ColorType;
info2011= imfinfo("Image2011.png");
type2011=info2011.ColorType;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[glacier1980,map1980] = imread("Image1980.png");
figure(1)
imshow(glacier1980,map1980)
title("Bear Glacier in 1980")
[glacier2011,map2011] = imread("Image2011.png");
figure(2)
imshow(glacier2011,map2011)
title("Bear Glacier in 2011")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
gs1980 = ind2gray(glacier1980,map1980);
gs2011 = ind2gray(glacier2011,map2011);
figure(3)
imshowpair(gs1980,gs2011,"montage")

figure(4)
rgb2011 = ind2rgb(glacier2011,map2011);
imshow(rgb2011)

figure(5)
[ind2011,map] = rgb2ind(rgb2011,16);
imshow(ind2011,map)
