clc;
close all;
clear all;

format long;
dx = 0.01;
x = 0 : dx : 3;

y = exp(x) - x - 2;
y0 = zeros(1, length(y));

figure(1);
plot(x, y, x, y0);
%xlim([-1 1.5]);
title('Given Function');
xlabel('x co-ordinate');
ylabel('y co-ordinate');


y1 = exp(x);
y2 = x + 2;
figure(2);
plot(x, y1, x, y2);
legend('y_{1}=e^{x}','y_{2}=x+2','Location',"best");
title('Checking Roots');
%xlim([-1 1.5]);
%ylim([-0.5 10]);
xlabel('x co-ordinate');
ylabel('y co-ordinate');

error = 10 ^ (-5);
t = -log10(error) - 1;

a5 = 1;
b5 = 2;
i = 1;
c5 = (a5 + b5) / 2;

while b5 - c5 >= error
    A5(i) = a5;
    B5(i) = b5;
    C5(i) = (a5 + b5) / 2;
    f_c5(i) = exp(c5) - c5 - 2;
    diff5(i) = b5 - c5;
    prod5(i) = (exp(a5) - a5- 2) * f_c5(i);
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

i = 1;
a7 = 1.5;
b7 = inf;
d7 = inf;

while abs(d7) >= error
    I7(i) = i;
    A7(i) = a7;
    F7(i) = exp(a7) - a7 - 2;
    Fp7(i) = exp(a7)-1;
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
title('Convergence towards Root');
legend('Newton-Raphson','Bisection','Location',"best");
xlabel('Iteration No.');
ylabel('Root');

