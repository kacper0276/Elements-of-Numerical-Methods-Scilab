// Renkel Kacper Informatyka IO, 169487, Wersja A
clear;
clc;
clf;

disp('Kacper Renkel, Informatyka, III rok, IO');

x = ones(5, 1);

for i= 1:5
    x(i) = cos(i - 1);
end

// Sposób bez pętli
// y(1,:) = x;

for i = 1:5
    y(1, i) = x(i, 1);
end

disp(y);

z = ones(1, 15);

for i = 1:15
    z(i) = exp(sin(i));
end

for i = 2:2:15
    disp(z(i));
end

// disp(z(2:2:15))

function fw = f(x, y);
    fw = sin(x)^2 + cos(y)^2;
endfunction;

disp(f(0.15, 1.15));

for i = 1:3
    for j = 1:3
       M(i,j) = 1 / (i + j) 
    end
end

function y=det2(M);
    y = M(1,1) * M(2,2) - M(1,2) * M(2,1);
endfunction

A = [1, 2; 2, 3];

disp(det2(A));

function y = g(x);
    if x < 0 then
        y = exp(x);
    else 
        y = cos(x) + sin(x);
    end
endfunction;

p = linspace(-5, 5, 100);

plot(p, g);

function y = fi(x, j, xw, n);
    l = repmat(x, n + 1, 1) - xw;
    l(j + 1) = 1;
    m = repmat(xw(j + 1), n + 1, 1) - xw;
    m(j + 1) = 1;
    y = prod(l)/prod(m);
endfunction;
