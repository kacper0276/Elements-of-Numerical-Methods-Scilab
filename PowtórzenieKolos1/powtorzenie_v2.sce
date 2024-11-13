clc;
clear;

a = [1, 2; 3, 4];

disp(a');
disp(a);

for i=0:3
    disp(a(i + 1));
end

disp(a(1, 2));

b = factorial(3); // Silnia

disp(b);

disp(mean(a)); // Średnia

c = repmat(a, 1, 2); // 1.   2.   1.   2.
                     // 3.   4.   3.   4.

c = repmat(a, 2, 1); //1.   2.
                     //3.   4.
                     //1.   2.
                     //3.   4.
disp(c);

v = linspace(1, 10, 5); // 1.   3.25   5.5   7.75   10.
disp(v);

a(:, 1) = 69;
disp(a);

a(2, :) = 100;
disp(a);
