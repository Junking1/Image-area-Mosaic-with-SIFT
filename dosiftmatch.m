function [matchLoc1,matchLoc2] = dosiftmatch(img1, img2,reimg1,reimg2)
tic
[matchLoc1,matchLoc2] = siftM(reimg1,reimg2);%匹配特征点%%%主要为了计时
toc
[matchLoc3,matchLoc4] = siftM1(img1, img2);%匹配图像特征点
toc