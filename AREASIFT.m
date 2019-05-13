clear
close all
img1 = imread('hall1.jpg');
img2 = imread('hall2.jpg');
[rioa,riob,ro,reimg1,reimg2] = findarea(img1,img2);
[img0,img10,img20] = imdo(img1,img2,reimg1,reimg2,1,rioa,riob);
figure(3)
imshow(img0);
imwrite(img0,'result.jpg');