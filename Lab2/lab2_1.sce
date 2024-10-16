clear;
clc;

M = [2.541 2.112
   1.872 1.556];
E = [0.001 0.001
     -0.001 -0.002];
b = [4.653
     3.428];

function y = wz2(C);
    y=C(1,1) * C(2,2) - C(1,2) * C(2,1);
endfunction;

function Y = msum(A,B);
    Y = A + B;
endfunction;

function Y = Cmk(G, b, k);
    Y=G;
    Y(:,k)=b;
endfunction;

G = msum(M,E);
w=wz2(G);

if w<>0 then
    // Metoda Kramera
    x(1) = wz2(Cmk(G, b, 1)) / w;
    x(2) = wz2(Cmk(G, b, 2)) / w;
    disp("x=", x);
else 
    // Komunikat
    disp("Brak rozwiązań");
end;
