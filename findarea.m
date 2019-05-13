function [rioa,riob,ro,reimg1,reimg2] = findarea(img1,img2)

[img1A,img1B,img1C,img1D] = mycut(img1);
[img2A,img2B,img2C,img2D] = mycut(img2);
roAA = mulro(img1A,img2A);
RO(1,1) = abs(roAA);
roAB = mulro(img1A,img2B);

RO(1,2) = abs(roAB);

roAC = mulro(img1A,img2C);
RO(1,3) = abs(roAC);

roAD = mulro(img1A,img2D);
RO(1,4) = abs(roAD);

roBA = mulro(img1B,img2A);
RO(2,1) = abs(roBA);

roBB = mulro(img1B,img2B);
RO(2,2) = abs(roBB);

roBC = mulro(img1B,img2C);
RO(2,3) = abs(roBC);

roBD = mulro(img1B,img2D);
RO(2,4) = abs(roBD);

roCA = mulro(img1C,img2A);
RO(3,1) = abs(roCA);

roCB = mulro(img1C,img2B);
RO(3,2) = abs(roCB);

roCC = mulro(img1C,img2C);
RO(3,3) = abs(roCC);

roCD = mulro(img1C,img2D);
RO(3,4) = abs(roCD);

roDA = mulro(img1D,img2A);
RO(4,1) = abs(roDA);

roDB = mulro(img1D,img2B);
RO(4,2) = abs(roDB);

roDC = mulro(img1D,img2C);
RO(4,3) = abs(roDC);

roDD = mulro(img1D,img2D);
RO(4,4) = abs(roDD);

[rows,cols]=find(RO==max(max(RO)));
ro = RO(rows,cols);
switch rows
    case 1
        reimg1 = img1A;
        rioa = 1;
    case 2
        reimg1 = img1B;
        rioa = 2;
    case 3
        reimg1 = img1C;
        rioa = 3;
    case 4
        reimg1 = img1D;
        rioa = 4;
end

switch cols
    case 1
        reimg2 = img2A;
        riob = 1;
    case 2
        reimg2 = img2B;
        riob = 2;
    case 3
        reimg2 = img2C;
        riob = 3;
    case 4
        reimg2 = img2D;
        riob = 4;
end


