function [y1,y2,y3]= jdfusion( img10,img20 )
%����x= jdfusion( x1,x2 )ʵ�ֻ��ڼ�Ȩƽ���ļ�ͼ���ں�
%���������
%      x1----����ԭͼ��1
%      x2----����ԭͼ��2
%���������
%      y1----���ڼ�Ȩƽ�����ں�ͼ��
%      y2----��������ֵѡ����ں�ͼ��
%      y3----��������ֵѡС���ں�ͼ��
%----------------------------------------------------%
figure(1);imshow(img10);title('ͼ��1');
figure(2);imshow(img20);title('ͼ��2');
img10=double(img10);
img20=double(img20);
[m,n]=size(img10);

for i=1:m
    for j=1:n
        y1(i,j)=0.5*img10(i,j)+0.5*img20(i,j);  %���ڼ�Ȩƽ���ļ�ͼ���ںϷ���
    end
end

figure(3);imshow(uint8(y1));title('���ڼ�Ȩƽ�����ں�ͼ��');

for i=1:m
    for j=1:n
        if img10(i,j)>=img20(i,j)               %��������ֵѡ��ļ�ͼ���ںϷ���
            y2(i,j)=img10(i,j);
        else
            y2(i,j)=img20(i,j);
        end
    end
end

figure(4);imshow(uint8(y2));title('��������ֵѡ����ں�ͼ��');

for i=1:m
    for j=1:n
        if img10(i,j)<img20(i,j)                %��������ֵѡС�ļ�ͼ���ںϷ���
            y3(i,j)=img10(i,j);
        else
            y3(i,j)=img20(i,j);
        end
    end
end

figure(5);imshow(uint8(y3));title('��������ֵѡС���ں�ͼ��');

end