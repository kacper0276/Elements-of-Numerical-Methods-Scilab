clear;
clc;
// Dane wejściowe
n = 3;
a = -0.5;
b = 2*%pi;
x0 = 0;
x1 = %pi/4;
x2 = %pi/2;
x3 = 3*%pi/2;
x_bar = 9*%pi/10;
r = 2;

xw = [x0; x1; x2; x3];
// xb = 9*%pi/10;
xb = 49*%pi / 100; // 49 100 pi

function y = f(x);
    y = sin(x);
endfunction;

for i = 0:n
    yw(i + 1)=f(xw(i + 1));
end

function y = fp(x);
    y = sin(x);
endfunction;

function y = omega(x, xw, n);
    for i=0:n
        tw(i + 1) = x - xw(i + 1);
    end
    y = prod(tw);
endfunction;

// Kod z zajęć, laby 3 - własna wersja

function y = fi(x, j, xw, n);
    l = repmat(x, n + 1, 1) - xw;
    l(j + 1) = 1;
    m = repmat(xw(j + 1), n + 1, 1) - xw;
    m(j + 1) = 1;
    y = prod(l)/prod(m);
    // prod - iloczyn
endfunction;

factorial_n1 = factorial(n + 1);

omega_abs = abs(omega(x_bar, xw, n));

lsup = 101; // Liczba punktów

// ToDo: Dokładnie zobaczyć jak działa linspace, factorial

tw = linspace(a, b, lsup);

for i = 1 : lsup
    fptw(i)=abs(fp(tw(i)));
end;
// LUB fptw = abs(fp(tw));

M = max(fptw);
err = M * abs(omega(xb, xw, n)) / factorial(n + 1);

if err<10^(-r) then
    // Wzór interpolacyjny Lagrange'a
    Wn = 0;
    for i = 0 : n
        Wn = Wn + yw(i + 1) * fi(xb, i, xw, n);
    end;
    disp("|W"+string(n)+"("+string(xb)+")-f("+string(xb)+")| < " + string(err));
    disp("f("+string(xb)+")| = " + string(Wn));
else 
    // Komunikat
    disp("Oszacowanie błędu jest zbyt duże: |W"+string(n)+"("+string(xb)+")-f("+string(xb)+")|<"    + string(err)); 
end;
