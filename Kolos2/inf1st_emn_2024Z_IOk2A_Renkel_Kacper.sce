// Renkel Kacper, Informatyka Ogólna, Numer kolokwium: 2; wersja: A

clear;
clc;

a = -1; 
b = 1; 
r = 4;
x0 = null;
xm1 = null;

function y = f(x);
    y = sin(x) + (x + 1)^2;
endfunction;

function y = fp(x);
    y = cos(x) + 2*x + 2;
endfunction;

function y = fd(x);
    y = 2 - sin(x);
endfunction;

// Funkcja start
function y = start();
    if f(a) * fd(a) < 0 then
        y = [a; b];
    else
        y = [b; a];
    end
endfunction;

// Funkcja new_sol
function y = new_sol(xn, xm1);
    y = xn - ( (f(xn)) / (f(xn) - f(xm1))) * (xn - xm1);
endfunction;

if f(a) * f(b) >= 0 | fp(a) * fp(b) <= 0 | fd(a) * fd(b) <= 0 then
    disp("Zalożenia nie spełnione");
    quit;
end

wi = 0;

// Wywołanie metody start
res = start();
x0 = res(1)(1);
xm1 = res(2)(1);

xn = x0;
while %t do
    wi = wi + 1; 
    xn_next = new_sol(xn, xm1);
    
    disp('Przybliżenie ' + string(wi) + " wartość: " + string(xn_next));
    
    if abs(xn_next - xn) / abs(f(xn) - f(xn_next)) * abs(f(xn)) < 10^(-r) then
        xm1 = xn;
        xn = xn_next;
        break;
    end
    
    xm1 = xn;
    xn = xn_next;
end
