function [mymatchLoc1,mymatchLoc2] = projection(img1,img2,reimg1, reimg2,matchLoc1,matchLoc2,rioa,riob)
SIZER1 = size(reimg1);
SIZER2 = size(reimg2);
SIZE1 = size(img1);
SIZE2 = size(img2);
L1 = size(matchLoc1);
L2 = size(matchLoc2);
switch rioa
    case 1
        mymatchLoc1 = matchLoc1;
    case 2
        for i = 1:1:L1(1)
            mymatchLoc1(i,1) = matchLoc1(i,1);
            mymatchLoc1(i,2) = SIZE1(1) - SIZER1(1)+matchLoc1(i,2);
        end
    case 3
        for i = 1:1:L1(1)
            mymatchLoc1(i,1) = SIZE1(2) - SIZER1(2)+matchLoc1(i,1);
            mymatchLoc1(i,2) = matchLoc1(i,2);
        end
    case 4
        for i = 1:1:L1(1)
            mymatchLoc1(i,1) = SIZE1(2) - SIZER1(2)+matchLoc1(i,1);
            mymatchLoc1(i,2) = SIZE1(1) - SIZER1(1)+matchLoc1(i,2);
        end
end

switch riob
    case 1
        mymatchLoc2 = matchLoc2;
    case 2
        for i = 1:1:L2(1)
            mymatchLoc2(i,1) = matchLoc2(i,1);
            mymatchLoc2(i,2) = SIZE2(1) - SIZER2(1)+matchLoc2(i,2);
        end
    case 3
        for i = 1:1:L2(1)
            mymatchLoc2(i,1) = SIZE2(2) - SIZER2(2)+matchLoc2(i,1);
            mymatchLoc2(i,2) = matchLoc2(i,2);
        end
    case 4
        for i = 1:1:L2(1)
            mymatchLoc2(i,1) = SIZE2(2) - SIZER2(2)+matchLoc2(i,1);
            mymatchLoc2(i,2) = SIZE2(1) - SIZER2(1)+matchLoc2(i,2);
        end
end