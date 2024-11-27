clc;
clear;

r = 4;
n_max = 50;
h = 0.001;
a = -2;
b = -0.5;

function fx = f(x);
    fx = ((x ^ 2) - 3) * sin(x);
endfunction;

function fx = f1(x);
    fx = (f(x + h) - f(x)) / h
endfunction

function fx = f2(x);
    fx = (f1(x + h) - f1(x)) / h
endfunction

kw = 0;
if f(a) * f(b) < 0 then
    // Realizacja połączenia 
    wi = 1;
    x(wi) = a;
    while ~(f1(a, h) * f1(b, h) > 0 && f2(a, h) * f2(b, h) > 0)
        // Realizacja metody połowienia
        if ~(wi < n_max) then
            kw = 1;
            break;
        end;
        wi = wi + 1;
        x(wi) = (a + b) / 2;
        if abs(x(wi) - x(wi - 1)) < 10^(-r) then
            kw = 2;
            break;
        end;
        if f(a) * f(x(wi)) < 0 then
            b = x(wi);
        else
            a = x(wi);
        end;
    end;
    if kw == 0 then
        // Realizacja m.r-f.
        wi = wi + 1;
        if f1(a, h) * f2(a, h) < 0 then
            c = a;
            x(wi) = b;
        else
            c = b
            x(wi) = a;
        end;
        kw = 1;
       
    end;
else 
    // Brak spełnienia
    kw = 3;
end

select kw
case 1 then
    disp('Osiągnięto maksymalną liczbę iteracji nmax =' + string(n_max));
case 2 then
    disp('Osiągnięto dokładność rzędu ' + string (10^(-r)));
    disp('X('+string(wi)+')='+string(x(wi));
case 3 then
    disp('Niespełnione założenia metody połowienia');
end;
end
