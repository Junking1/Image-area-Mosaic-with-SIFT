function [matchLoc1,matchLoc2] = dosiftmatch(img1, img2,reimg1,reimg2)
tic
[matchLoc1,matchLoc2] = siftM(reimg1,reimg2);%ƥ��������%%%��ҪΪ�˼�ʱ
toc
[matchLoc3,matchLoc4] = siftM1(img1, img2);%ƥ��ͼ��������
toc