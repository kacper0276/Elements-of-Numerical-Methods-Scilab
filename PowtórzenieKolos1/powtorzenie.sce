// 1. Proste operacje matematyczne
disp("Proste operacje matematyczne:");
a = 5;  // Definicja zmiennej a
b = 3;  // Definicja zmiennej b

// Dodawanie
dodawanie = a + b;
disp("Dodawanie a + b = " + string(dodawanie));

// Odejmowanie
odejmowanie = a - b;
disp("Odejmowanie a - b = " + string(odejmowanie));

// Mnożenie
mnozenie = a * b;
disp("Mnożenie a * b = " + string(mnozenie));

// Dzielenie
dzielenie = a / b;
disp("Dzielenie a / b = " + string(dzielenie));

// 2. Operacje na macierzach

disp("Operacje na macierzach:");

// Definicja dwóch macierzy
A = [1, 2; 3, 4];  // Macierz 2x2
B = [5, 6; 7, 8];  // Macierz 2x2

disp("Macierz A:");
disp(A);

disp("Macierz B:");
disp(B);

// Dodawanie macierzy
C = A + B;
disp("Dodawanie macierzy A + B:");
disp(C);

// Mnożenie macierzy
D = A * B;
disp("Mnożenie macierzy A * B:");
disp(D);

// Transponowanie macierzy
A_transpose = A';
disp("Transponowanie macierzy A:");
disp(A_transpose);

// 3. Tworzenie funkcji w SciLab

// Definicja funkcji obliczającej pole prostokąta
function pole = pole_prostokata(dlugosc, szerokosc)
    pole = dlugosc * szerokosc;  // Pole = długość * szerokość
endfunction

// Wywołanie funkcji
dlugosc = 7;
szerokosc = 3;
pole = pole_prostokata(dlugosc, szerokosc);
disp("Pole prostokąta o wymiarach " + string(dlugosc) + " x " + string(szerokosc) + " wynosi: " + string(pole));

// 4. Pętla do obliczenia sumy elementów w macierzy

disp("Obliczanie sumy elementów w macierzy:");

macierz = [1, 2, 3; 4, 5, 6; 7, 8, 9];  // Macierz 3x3
suma = 0;

// Pętla do sumowania elementów macierzy
for i = 1:size(macierz, 1)  // Dla każdego wiersza
    for j = 1:size(macierz, 2)  // Dla każdej kolumny
        suma = suma + macierz(i, j);  // Dodaj element do sumy
    end
end

disp("Suma elementów w macierzy wynosi: " + string(suma));

// 5. Funkcja obliczająca średnią z elementów wektora
function srednia = oblicz_srednia(wektor)
    suma = sum(wektor);  // Obliczamy sumę elementów wektora
    liczba_elementow = length(wektor);  // Liczba elementów wektora
    srednia = suma / liczba_elementow;  // Średnia = suma / liczba elementów
endfunction

wektor = [3, 5, 7, 9, 11];
srednia = oblicz_srednia(wektor);
disp("Średnia z elementów wektora wynosi: " + string(srednia));

// 6. Funkcje do obliczania wyznacznika macierzy

// Funkcja obliczająca wyznacznik macierzy 2x2
function det_2x2 = wyznacznik_2x2(A)
    // Wyznacznik macierzy 2x2: |A| = a*d - b*c
    det_2x2 = A(1,1) * A(2,2) - A(1,2) * A(2,1);
endfunction

// Funkcja obliczająca wyznacznik macierzy 3x3
function det_3x3 = wyznacznik_3x3(A)
    // Wyznacznik macierzy 3x3 za pomocą rozwinięcia Laplace'a
    det_3x3 = A(1,1)*(A(2,2)*A(3,3) - A(2,3)*A(3,2)) - A(1,2)*(A(2,1)*A(3,3) - A(2,3)*A(3,1)) + A(1,3)*(A(2,1)*A(3,2) - A(2,2)*A(3,1));
endfunction

// Funkcja obliczająca wyznacznik macierzy 4x4
function det_4x4 = wyznacznik_4x4(A)
    // Wyznacznik macierzy 4x4 za pomocą rozwinięcia Laplace'a
    det_4x4 = A(1,1)*(A(2,2)*(A(3,3)*A(4,4) - A(3,4)*A(4,3)) - A(2,3)*(A(3,2)*A(4,4) - A(3,4)*A(4,2)) + A(2,4)*(A(3,2)*A(4,3) - A(3,3)*A(4,2))) - A(1,2)*(A(2,1)*(A(3,3)*A(4,4) - A(3,4)*A(4,3)) - A(2,3)*(A(3,1)*A(4,4) - A(3,4)*A(4,1)) + A(2,4)*(A(3,1)*A(4,3) - A(3,3)*A(4,1))) + A(1,3)*(A(2,1)*(A(3,2)*A(4,4) - A(3,4)*A(4,2)) - A(2,2)*(A(3,1)*A(4,4) - A(3,4)*A(4,1)) + A(2,4)*(A(3,1)*A(4,2) - A(3,2)*A(4,1))) - A(1,4)*(A(2,1)*(A(3,2)*A(4,3) - A(3,3)*A(4,2)) - A(2,2)*(A(3,1)*A(4,3) - A(3,3)*A(4,1)) + A(2,3)*(A(3,1)*A(4,2) - A(3,2)*A(4,1)));
endfunction

// Przykłady obliczania wyznaczników

A2 = [1, 2; 3, 4];  // Macierz 2x2
A3 = [1, 2, 3; 4, 5, 6; 7, 8, 9];  // Macierz 3x3
A4 = [1, 2, 3, 4; 5, 6, 7, 8; 9, 10, 11, 12; 13, 14, 15, 16];  // Macierz 4x4

disp("Wyznacznik macierzy 2x2:");
det_2x2_val = wyznacznik_2x2(A2);
disp(det_2x2_val);

disp("Wyznacznik macierzy 3x3:");
det_3x3_val = wyznacznik_3x3(A3);
disp(det_3x3_val);

disp("Wyznacznik macierzy 4x4:");
det_4x4_val = wyznacznik_4x4(A4);
disp(det_4x4_val);

// 7. Użycie funkcji abs

disp("Przykład użycia funkcji abs:");

// Definicja liczby zespolonej
z = -3 + 4 * %i;  // Liczba zespolona

// Obliczanie modułu liczby zespolonej (abs)
modul = abs(z);
disp("Moduł liczby zespolonej z = " + string(modul));

// 8. Pętla do obliczenia silni (factorial) za pomocą pętli

disp("Obliczanie silni (factorial) za pomocą pętli:");

function silnia = oblicz_silnie(n)
    silnia = 1;
    for i = 1:n
        silnia = silnia * i;  // Mnożenie kolejnych liczb
    end
endfunction

n = 5;
silnia_val = oblicz_silnie(n);
disp("Silnia z liczby " + string(n) + " wynosi: " + string(silnia_val));

disp("Obliczanie silni za pomocą funkcji factorial:");

silnia_fun = factorial(n);
disp("Silnia z liczby " + string(n) + " wynosi (wbudowana funkcja): " + string(silnia_fun));

// Kolejne metody

disp("1. Przykłady funkcji matematycznych i przydatnych metod:");

// Funkcja abs - wartość bezwzględna
disp("Funkcja abs - wartość bezwzględna:");
x = -4.5;
disp("Wartość bezwzględna liczby " + string(x) + " wynosi: " + string(abs(x)));

// Funkcja sqrt - pierwiastek kwadratowy
disp("Funkcja sqrt - pierwiastek kwadratowy:");
x = 16;
disp("Pierwiastek kwadratowy z liczby " + string(x) + " wynosi: " + string(sqrt(x)));

// Funkcja sin - sinus
disp("Funkcja sin - sinus:");
x = %pi / 2;  // Pi/2 to kąt 90 stopni
disp("Sinus z " + string(x) + " (radiany) wynosi: " + string(sin(x)));

// Funkcja cos - cosinus
disp("Funkcja cos - cosinus:");
x = %pi / 3;  // Pi/3 to kąt 60 stopni
disp("Cosinus z " + string(x) + " (radiany) wynosi: " + string(cos(x)));

// Funkcja exp - funkcja wykładnicza (e^x)
disp("Funkcja exp - funkcja wykładnicza (e^x):");
x = 2;
disp("e do potęgi " + string(x) + " wynosi: " + string(exp(x)));

// Funkcja log - logarytm naturalny
disp("Funkcja log - logarytm naturalny:");
x = 7;
disp("Logarytm naturalny z liczby " + string(x) + " wynosi: " + string(log(x)));

// Funkcja log10 - logarytm dziesiętny
disp("Funkcja log10 - logarytm dziesiętny:");
x = 1000;
disp("Logarytm dziesiętny z liczby " + string(x) + " wynosi: " + string(log10(x)));

// 2. Przydatne operacje na macierzach

disp("2. Przydatne operacje na macierzach:");

// Funkcja det - wyznacznik macierzy
disp("Funkcja det - wyznacznik macierzy:");
A = [1, 2, 3; 4, 5, 6; 7, 8, 9];  // Macierz 3x3
disp("Wyznacznik macierzy A:");
disp(det(A));

// Funkcja inv - odwrotność macierzy
disp("Funkcja inv - odwrotność macierzy:");
A = [4, 7; 2, 6];  // Macierz 2x2
invA = inv(A);  // Obliczanie odwrotności
disp("Odwrotność macierzy A:");
disp(invA);

// Funkcja eig - wartości i wektory własne macierzy
disp("Funkcja eig - wartości i wektory własne:");
A = [4, 1; 2, 3];  // Macierz 2x2
[W, V] = eig(A);  // W - wartości własne, V - wektory własne
disp("Wartości własne macierzy A:");
disp(W);
disp("Wektory własne macierzy A:");
disp(V);

// Funkcja norm - norma macierzy
disp("Funkcja norm - norma macierzy:");
A = [1, 2; 3, 4];  // Macierz 2x2
disp("Norma macierzy A:");
disp(norm(A));

// Funkcja trace - ślad macierzy
disp("Funkcja trace - ślad macierzy:");
A = [1, 2, 3; 4, 5, 6; 7, 8, 9];  // Macierz 3x3
disp("Ślad macierzy A:");
disp(trace(A));

// Funkcja sum - suma elementów w macierzy
disp("Funkcja sum - suma elementów w macierzy:");
A = [1, 2, 3; 4, 5, 6];  // Macierz 2x3
disp("Suma elementów w macierzy A:");
disp(sum(A));

// Funkcja mean - średnia elementów w macierzy
disp("Funkcja mean - średnia elementów w macierzy:");
disp("Średnia elementów w macierzy A:");
disp(mean(A));

// Funkcja max - maksymalny element w macierzy
disp("Funkcja max - maksymalny element w macierzy:");
disp("Maksymalny element w macierzy A:");
disp(max(A));

// Funkcja min - minimalny element w macierzy
disp("Funkcja min - minimalny element w macierzy:");
disp("Minimalny element w macierzy A:");
disp(min(A));

// 3. Pętla do obliczania silni (factorial) za pomocą pętli

disp("3. Obliczanie silni (factorial) za pomocą pętli:");

function silnia = oblicz_silnie(n)
    silnia = 1;
    for i = 1:n
        silnia = silnia * i;  // Mnożenie kolejnych liczb
    end
endfunction

n = 5;  // Przykładowa liczba
silnia_val = oblicz_silnie(n);
disp("Silnia z liczby " + string(n) + " wynosi: " + string(silnia_val));

// 4. Użycie funkcji factorial

disp("4. Obliczanie silni za pomocą funkcji factorial:");

silnia_fun = factorial(n);  // Korzystanie z wbudowanej funkcji factorial
disp("Silnia z liczby " + string(n) + " wynosi (wbudowana funkcja): " + string(silnia_fun));

// 5. Funkcja round - zaokrąglanie liczby

disp("5. Funkcja round - zaokrąglanie liczby:");
x = 3.14159;
disp("Zaokrąglenie liczby " + string(x) + " wynosi: " + string(round(x)));

// 6. Funkcja floor - zaokrąglanie w dół

disp("6. Funkcja floor - zaokrąglanie w dół:");
x = 3.7;
disp("Zaokrąglenie liczby " + string(x) + " w dół wynosi: " + string(floor(x)));

// 7. Funkcja ceil - zaokrąglanie w górę

disp("7. Funkcja ceil - zaokrąglanie w górę:");
x = 3.2;
disp("Zaokrąglenie liczby " + string(x) + " w górę wynosi: " + string(ceil(x)));

// Lepsze obliczanie wyznacznikow
function det_4x4 = wyznacznik_4x4(A)
    // Sprawdzenie, czy macierz A jest macierzą 4x4
    [m, n] = size(A);
    if m <> 4 | n <> 4 then
        disp("Macierz musi mieć wymiary 4x4!");
        return;
    end

    // Inicjalizacja zmiennej dla wyznacznika
    det_4x4 = 0;

    // Pętla do obliczania rozwinięcia Laplace'a
    for i = 1:4
        // Wyodrębnienie podmacierzy 3x3 przez usunięcie pierwszego wiersza i i-tej kolumny
        submatrix = A([2:4], [1:i-1, i+1:4]);
        
        // Rekurencyjne obliczanie wyznacznika dla podmacierzy 3x3
        det_sub = wyznacznik_3x3(submatrix);
        
        // Dodanie/skrócenie wyznacznika w zależności od parzystości indeksu
        if mod(i, 2) == 1 then
            det_4x4 = det_4x4 + A(1, i) * det_sub;  // Dodajemy dla nieparzystych indeksów
        else
            det_4x4 = det_4x4 - A(1, i) * det_sub;  // Odejmujemy dla parzystych
        end
    end
endfunction

// Funkcja obliczająca wyznacznik macierzy 3x3
function det_3x3 = wyznacznik_3x3(A)
    // Sprawdzenie, czy macierz A jest macierzą 3x3
    [m, n] = size(A);
    if m <> 3 | n <> 3 then
        disp("Macierz musi mieć wymiary 3x3!");
        return;
    end
    
    // Obliczanie wyznacznika dla macierzy 3x3
    det_3x3 = A(1,1)*(A(2,2)*A(3,3) - A(2,3)*A(3,2)) - A(1,2)*(A(2,1)*A(3,3) - A(2,3)*A(3,1)) + A(1,3)*(A(2,1)*A(3,2) - A(2,2)*A(3,1));
endfunction
