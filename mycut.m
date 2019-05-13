function [img1A,img1B,img1C,img1D] = mycut(img1)
L1 = size(img1);
k = 1;
m = 1;
for i = 1:1:L1(1)
    for j = 1:1:L1(2)
        if (i<L1(1)/2)&&(j<L1(2)/2)
            img1A(i,j) = img1(i,j);
            k = i;
            m = j;
        elseif(i>=L1(1)/2)&&(j<L1(2)/2)
            img1B(i-k,j) = img1(i,j);
        elseif(i<L1(1)/2)&&(j>=L1(2)/2)
            img1C(i,j-m) = img1(i,j);
        else
            img1D(i-k,j-m) = img1(i,j);
        end
    end
end
% figure(1)
% imshow(img1A);
% figure(2)
% imshow(img1B);
% figure(3)
% imshow(img1C);
% figure(4)
% imshow(img1D);

