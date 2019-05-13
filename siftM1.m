function [matchLoc1, matchLoc2] = siftM1(img1, img2)

distRatio = 0.6;

[des1, loc1] = sif(img1);
[des2, loc2] = sif(img2);

des2t = des2';                          % Precompute matrix transpose
matchTable = zeros(1,size(des1,1));
for i = 1 : size(des1,1)
   dotprods = des1(i,:) * des2t;        % Computes vector of dot products
   [vals,indx] = sort(acos(dotprods));  % Take inverse cosine and sort results

   if (vals(1) < distRatio * vals(2))
      matchTable(i) = indx(1);
   else
      matchTable(i) = 0;
   end
end

img3 = plotii(img1,img2);

idx1 = find(matchTable);
idx2 = matchTable(idx1);
x1 = loc1(idx1,2);
x2 = loc2(idx2,2);
y1 = loc1(idx1,1);
y2 = loc2(idx2,1);

matchLoc1 = [x1,y1];
matchLoc2 = [x2,y2];

end