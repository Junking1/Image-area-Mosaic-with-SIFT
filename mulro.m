function ro = mulro(g,f)
g = double(g);
f = double(f);
L1 = size(g);
L2 = size(f);

if L1(1)>L2(1)
    M = L2(1);
else
    M = L1(1);
end

if L1(2)>L2(2)
    N = L2(2);
else
    N = L1(2);
end
Sgf = 0;
Sff = 0;
Sf = 0;
Sgg= 0;
Sg= 0;
for i = 1:1:M
    for j = 1:1:N
        Sgf = g(i,j)*f(i,j) + Sgf;
        Sff = f(i,j)*f(i,j) + Sff;
        Sf = f(i,j) + Sf;
        Sgg= g(i,j)*g(i,j) + Sgg;
        Sg= g(i,j) + Sg;
    end
end

ro = (Sgf - Sg*Sf/(M*N))/(sqrt((Sgg - Sg*Sg/(M*N))*(Sff - Sf*Sf/(M*N))));


