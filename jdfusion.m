function [y1,y2,y3]= jdfusion( img10,img20 )
%函数x= jdfusion( x1,x2 )实现基于加权平均的简单图像融合
%输入参数：
%      x1----输入原图像1
%      x2----输入原图像2
%输出参数：
%      y1----基于加权平均的融合图像
%      y2----基于像素值选大的融合图像
%      y3----基于像素值选小的融合图像
%----------------------------------------------------%
figure(1);imshow(img10);title('图像1');
figure(2);imshow(img20);title('图像2');
img10=double(img10);
img20=double(img20);
[m,n]=size(img10);

for i=1:m
    for j=1:n
        y1(i,j)=0.5*img10(i,j)+0.5*img20(i,j);  %基于加权平均的简单图像融合方法
    end
end

figure(3);imshow(uint8(y1));title('基于加权平均的融合图像');

for i=1:m
    for j=1:n
        if img10(i,j)>=img20(i,j)               %基于像素值选大的简单图像融合方法
            y2(i,j)=img10(i,j);
        else
            y2(i,j)=img20(i,j);
        end
    end
end

figure(4);imshow(uint8(y2));title('基于像素值选大的融合图像');

for i=1:m
    for j=1:n
        if img10(i,j)<img20(i,j)                %基于像素值选小的简单图像融合方法
            y3(i,j)=img10(i,j);
        else
            y3(i,j)=img20(i,j);
        end
    end
end

figure(5);imshow(uint8(y3));title('基于像素值选小的融合图像');

end