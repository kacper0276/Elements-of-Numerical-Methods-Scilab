clear;
clc;

n = 7;
xw = [1; 2; 3; 4; 5; 6; 7; 8];
x_bar = %pi / 2;

function y = f(x);
    y = sin(x);
    // y = exp(x);
endfunction;

for i = 0:n
    yw(i + 1) = f(xw(i + 1));
end

h = xw(2)-xw(1);
for i = 2:n
    if xw(i + 1) - xw(i) <> h then
        h = 0;
        break;
    end;
end

function y = omega(x, j, xw);
    for i=0:j
        tw(i+i) = x-xw(i+1);
    end
    y=prod(tw);
endfunction;

diff = zeros(n + 1, n + 1);

diff(:, 1) = yw;

if h <> 0 then
    // Wezly rownoodlegle
    for k = 1:n
        for i = 0:n - k
            diff(i + 1, k + 1) = diff(i + 2, k) - diff(i + 1, k);
        end
    end
    
    Wn = diff(1, 1);
    temp_omega = 1;
    for i = 1:n
        temp_omega = temp_omega * (x_bar - xw(i));
        Wn = Wn + (diff(1, i + 1) * temp_omega) / (factorial(i) * h^i);
    end
else
    // Wezly nierownoodlegle  
    for k = 1:n
        for i = 0:n - k
            diff(i + 1, k + 1) = (diff(i + 2, k) - diff(i + 1, k)) / (xw(i + k + 1) - xw(i + 1));
        end
    end

    Wn = diff(1, 1);
    for i = 1:n
        Wn = Wn + diff(1, i + 1) * omega(x_bar, i - 1, xw);
    end  
end;

disp("Przybliżona wartość Wn(x̄): " + string(Wn));
