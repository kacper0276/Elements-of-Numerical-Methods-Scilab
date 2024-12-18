// Dane wejściowe
clear;
clc;

n = 8; // liczba węzłów
x = [-1.1, -0.83, -0.57, -0.28, -0.02, 0.16, 0.47, 0.95, 1.23]; // węzły
m = 0; // stopień wielomianu aproksymacyjnego (można zmieniać między 0, 1, 2)

function y = f(x);
    y = exp(sin(x)); // zadana funkcja
endfunction;

// Obliczenie wartości funkcji w węzłach
fx = f(x);

// Inicjalizacja macierzy
g = zeros(2*m + 1, 1);
rho = zeros(m + 1, 1);

// Obliczenie g_j i rho_j
for j = 0:2*m
    g(j + 1) = sum(x.^j);
end

for j = 0:m
    rho(j + 1) = sum(fx .* (x.^j));
end

// Wyznaczenie współczynników wielomianu aproksymacyjnego
select m
    case 0 then
        a0 = rho(1) / g(1);
        coeff = [a0];
        
    case 1 then
        denom = g(2)^2 - g(1)*g(3);
        a0 = (-g(3)*rho(1) + g(2)*rho(2)) / denom;
        a1 = (g(2)*rho(1) - g(1)*rho(2)) / denom;
        coeff = [a0, a1];
        
    case 2 then
        denom = g(3)^3 + g(1)*g(3)^2 + g(2)^2*g(4) - g(3)*(2*g(2)*g(3) + g(1)*g(4));
        a0 = (g(3)^2*rho(1) - g(3)*g(4)*rho(1) + g(2)*g(4)*rho(2) + g(3)^2*rho(3) - g(3)*(g(3)*rho(2) + g(2)*rho(3))) / denom;
        a1 = (g(2)*g(4)*rho(1) + g(3)^2*rho(2) - g(3)*(g(3)*rho(1) + g(2)*rho(3)) + g(1)*(-g(4)*rho(2) + g(3)*rho(3))) / denom;
        a2 = (g(3)^2*rho(1) - g(2)*g(3)*rho(1) + g(1)*g(3)*rho(2) + g(2)^2*rho(3) - g(3)*(g(2)*rho(2) + g(1)*rho(3))) / denom;
        coeff = [a0, a1, a2];
        
    else
        disp("Nieprawidłowa wartość parametru m");
        coeff = [];
end

// Wyświetlenie współczynników
disp("Współczynniki wielomianu aproksymacyjnego:");
disp(coeff);

// Funkcja aproksymacyjna
function y = F(x, coeff);
    y = 0;
    for i = 0:length(coeff)-1
        y = y + coeff(i+1) * x.^i;
    end
endfunction;

// Przygotowanie siatki do rysowania wykresu
x_plot = linspace(x(1) - 0.1, x($) + 0.1, 100);
y_plot = F(x_plot, coeff);

// Rysowanie wykresu
clf;
plot(x_plot, y_plot, 'r-', "LineWidth", 2); // wykres wielomianu aproksymacyjnego
plot(x, fx, 'bo'); // punkty wyznaczone przez węzły

title("Aproksymacja średniokwadratowa");
xlabel("x");
ylabel("F(x)");

