clc;
close all;
clear all;

format long;
dx = 0.01;
x = -2 : dx : 2;

y = (x .^ 4) - x - 1;
y0 = zeros(1, length(y));

figure(1);
plot(x, y, x, y0);
title('Given Function');
xlabel('x co-ordinate');
ylabel('y co-ordinate');

y1 = x .^ 4;
y2 = x + 1;
figure(2);
plot(x, y1, x, y2);
legend('y_{1}=x^{4}','y_{2}=x+1','Location',"best");
title('Checking Roots');
xlabel('x co-ordinate');
ylabel('y co-ordinate');


error = 10 ^ (-6);
t = -log10(error) - 1;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

a5 = -1;
b5 = -0.5;
i = 1;
c5 = (a5 + b5) / 2;

while b5 - c5 >= error
    A5(i) = a5;
    B5(i) = b5;
    C5(i) = (a5 + b5) / 2;
    f_c5(i) = c5 .^ 4 - c5 - 1;
    diff5(i) = b5 - c5;
    prod5(i) = (a5 .^ 4 - a5 - 1) * f_c5(i);
    i = i + 1;
    if prod5(i - 1) > 0
        a5 = c5;
        Check5(i - 1) = "a = c";
    else
        b5 = c5;
        Check5(i - 1) = "b = c";
    end
    c5 = double((a5 + b5) / 2);
end

a6 = 1;
b6 = 2;
i = 1;
c6 = (a6 + b6) / 2;
    
while b6 - c6 >= error
    A6(i) = a6;
    B6(i) = b6;
    C6(i) = (a6 + b6) / 2;
    f_c6(i) = c6 .^ 4 - c6 - 1;
    diff6(i) = b6 - c6;
    prod6(i) = (a6 .^ 4 - a6 - 1) * f_c6(i);
    i = i + 1;
    
    if prod6(i - 1) > 0
        a6 = c6;
        Check6(i - 1) = "a = c";
    else
        b6 = c6;
        Check6(i - 1) = "b = c";
    end
    c6 = double((a6 + b6) / 2);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

i = 1;
a7 = -0.5;
b7 = inf;
d7 = inf;

while abs(d7) >= error
    I7(i) = i;
    A7(i) = a7;
    F7(i) = a7 .^ 4 - a7 - 1;
    Fp7(i) = 4 * (a7 .^ 3) - 1;
    b7 = a7 - (F7(i)/Fp7(i));
    B7(i) = b7;
    d7 = b7 - a7;
    D7(i) = d7;
    a7 = b7;
    i = i + 1;
end
I7 = round(I7,t);
A7 = round(A7,t);
F7 = round(F7,t);
Fp7 = round(Fp7,t);
B7 = round(B7,t);
D7 = round(D7,t);
Ans7 = [I7; A7; F7; Fp7; B7; D7]';
T1 = array2table(Ans7,...
    'VariableNames',{'Iteration_No' 'a' 'fx' 'fprimex' 'b' 'Difference'})
figure(3);
plot(B7);
hold on;
plot(C5,'r');
title('Convergence towards Root 1');
legend('Newton-Raphson','Bisection','Location',"best");
xlabel('Iteration No.');
ylabel('Root');

i = 1;
a8 = 1.5;
b8 = inf;
d8 = inf;

while abs(d8) >= error
    I8(i) = i;
    A8(i) = a8;
    F8(i) = a8 .^ 4 - a8 - 1;
    Fp8(i) = 4 * (a8 .^ 4) - 1;
    b8 = a8 - (F8(i)/Fp8(i));
    B8(i) = b8;
    d8 = b8 - a8;
    D8(i) = d8;
    a8 = b8;
    i = i + 1;
end
I8 = round(I8,t);
A8 = round(A8,t);
F8 = round(F8,t);
Fp8 = round(Fp8,t);
B8 = round(B8,t);
D8 = round(D8,t);
Ans8 = [I8; A8; F8; Fp8; B8; D8]';
T2 = array2table(Ans8,...
    'VariableNames',{'Iteration_No' 'a' 'fx' 'fprimex' 'b' 'Difference'})
figure(5);
plot(B6);
hold on;
plot(C6,'r');
title('Convergence towards Root 2');
legend('Newton-Raphson','Bisection','Location',"best");
xlabel('Iteration No.');
ylabel('Root');
