clc;
clear;

r = 10; 
nmax = 100; 
h = 0.001; 
a = -2; 
b = -0.8; 

function y = f(x)
    y = x * exp(sin(x)) + cos(x);
endfunction

function y = fp(x)
    h = 0.001; 
    y = (f(x + h) - f(x)) / h;
endfunction

function y = fd(x)
    h = 0.001; 
    y = (fp(x + h) - fp(x)) / h;
endfunction

function y = g(x)
    y = (f(x + f(x)) - f(x)) / f(x);
endfunction

wi = 0;

if f(a) * f(b) >= 0 | fp(a) * fp(b) <= 0 | fd(a) * fd(b) <= 0 then
    disp("Conditions for Steffensen’s method are not satisfied.");
    quit;
end

if f(a) * fd(a) > 0 then
    x0 = a;
else
    x0 = b;
end

xn = x0;
while %t do
    wi = wi + 1; 
    xn_next = xn - f(xn) / g(xn);
    
    if wi > nmax then
        disp("Maximum number of iterations reached.");
        break;
    end
    
    if abs(xn_next - xn) / abs(f(xn) - f(xn_next)) * abs(f(xn)) < 10^(-r) then
        xn = xn_next;
        disp("Solution found: x = " + string(xn) + " after " + string(wi) + " iterations.");
        break;
    end
    
    xn = xn_next;
end

disp("Final approximation: x = " + string(xn) + ", iterations: " + string(wi));
