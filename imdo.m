function [ imgout,img1,img221 ] = imdo( img1,img2,reimg1, reimg2,adjColor,rioa,riob )

[matchLoc1,matchLoc2] = dosiftmatch(img1,img2,reimg1, reimg2);

[matchLoc1,matchLoc2] = projection(img1,img2,reimg1, reimg2,matchLoc1,matchLoc2,rioa,riob);

% use RANSAC to find homography matrix
[H,corrPtIdx] = myfindH(matchLoc2',matchLoc1');%寻找单映射特征点
H  %#ok
tform = maketform('projective',H');%创建结构体H

img221 = imtransform(img2,tform); % reproject img2 投影变换
figure(2),imshow(img221)

% adjust color or grayscale linearly, using corresponding infomation
[M1 N1 dim] = size(img1);%返回图像矩阵
[M2 N2 ~] = size(img2);
if exist('adjColor','var') && adjColor == 1  %如果存在这个颜色，且添加颜色为1
	radius = 2;  %半径为2
	x1ctrl = matchLoc1(corrPtIdx,1);
	y1ctrl = matchLoc1(corrPtIdx,2);
	x2ctrl = matchLoc2(corrPtIdx,1);
	y2ctrl = matchLoc2(corrPtIdx,2);
	ctrlLen = length(corrPtIdx);
	s1 = zeros(1,ctrlLen); %生成全为0 的矩阵，保存在S1
	s2 = zeros(1,ctrlLen);
	for color = 1:dim
		for p = 1:ctrlLen
			left = round(max(1,x1ctrl(p)-radius));
			right = round(min(N1,left+radius+1));
			up = round(max(1,y1ctrl(p)-radius));
			down = round(min(M1,up+radius+1));
			s1(p) = sum(sum(img1(up:down,left:right,color))); % 取四周点色度
		end
		for p = 1:ctrlLen
			left = round(max(1,x2ctrl(p)-radius));
			right = round(min(N2,left+radius+1));
			up = round(max(1,y2ctrl(p)-radius));
			down = round(min(M2,up+radius+1));
			s2(p) = sum(sum(img2(up:down,left:right,color)));
		end
		sc = (radius*2+1)^2*ctrlLen;
		adjcoef = polyfit(s1/sc,s2/sc,1);
		img1(:,:,color) = img1(:,:,color)*adjcoef(1)+adjcoef(2);
	end
end

% do the mosaic
pt = zeros(3,4);
pt(:,1) = H*[1;1;1];
pt(:,2) = H*[N2;1;1];
pt(:,3) = H*[N2;M2;1];
pt(:,4) = H*[1;M2;1];
x2 = pt(1,:)./pt(3,:);
y2 = pt(2,:)./pt(3,:);

up = round(min(y2));
Yoffset = 0;
if up <= 0
	Yoffset = -up+1;
	up = 1;
end

left = round(min(x2));
Xoffset = 0;
if left<=0
	Xoffset = -left+1;
	left = 1;
end

[M3 N3 ~] = size(img221);
imgout(up:up+M3-1,left:left+N3-1,:) = img221;
	% img1 is above img21
imgout(Yoffset+1:Yoffset+M1,Xoffset+1:Xoffset+N1,:) = img1;

end


