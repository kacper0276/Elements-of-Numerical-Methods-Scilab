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
xb = 9*%pi/4;

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
endfunction
// TUTAJ JUZ NIE KOD Z ZAJEC - Dokończ

function y = phi_j(x, xw, j, n)
    licznik = [];
    mianownik = [];
    for i = 0:n
        if i ~= j then
            licznik($+1) = x - xw(i + 1);
            mianownik($+1) = xw(j + 1) - xw(i + 1);
        end
    end
    y = prod(licznik) / prod(mianownik);
endfunction

factorial_n1 = factorial(n + 1);

omega_xbar = abs(omega(x_bar, xw, n));

function y = f_prime(x)
    y = sin(x);
endfunction

lsup = 100;  // liczba punktów
x_points = linspace(a, b, lsup);
f_prime_vals = abs(f_prime(x_points));
Mn1 = max(f_prime_vals);

err = Mn1 * omega_xbar / factorial_n1;
disp("err = " + string(err));

if err < 10^(-r) then
    Wn_xbar = 0;
    for i = 0:n
        Wn_xbar = Wn_xbar + yw(i + 1) * phi_j(x_bar, xw, i, n);
    end
    disp("Wn(x_bar) = " + string(Wn_xbar));
else
    disp("Wymagana dokładność nie została osiągnięta.");
end
