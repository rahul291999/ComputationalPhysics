clc;
close all;
clear all;

format long;
dx = 0.01;
x = 0 : dx : 2.5;

y = (x .^ 3) - 2*x - 2;
y0 = zeros(1, length(y));

figure(1);
plot(x, y, x, y0);
%xlim([-1 1.5]);
title('Given Function');
xlabel('x co-ordinate');
ylabel('y co-ordinate');

% figure(2);
% plot(x, y, x, y0);
% title('Given Function(Maximized)');
% xlabel('x co-ordinate');
% ylabel('y co-ordinate');
% xlim([-1 -0.5]);
% ylim([-1 1]);

% figure(3);
% plot(x, y, x, y0);
% title('Given Function(Maximized)');
% xlabel('x co-ordinate');
% ylabel('y co-ordinate');
% xlim([1 1.5]);
% ylim([-1 1]);

y1 = x .^ 3;
y2 = 2*x + 2;
figure(2);
plot(x, y1, x, y2);
legend('y_{1}=x^{3}','y_{2}=2x+2','Location',"best");
title('Checking Roots');
%xlim([-1 1.5]);
%ylim([-0.5 10]);
xlabel('x co-ordinate');
ylabel('y co-ordinate');

% figure(5);
% plot(x, y1, x, y2);
% legend('y=x^{6}','y=x+1','Location',"best");
% title('Checking Root Positions(Maximized)');
% xlim([-1 -0.5]);
% 
% figure(6);
% plot(x, y1, x, y2);
% legend('y=x^{6}','y=x+1','Location',"best");
% title('Checking Root Positions(Maximized)');
% xlim([1 1.5]);

error = 10 ^ (-5);
t = -log10(error) - 1;

a1 = 1;
i = 1;
Iter1(i) = i;
A1(i) = a1;
f_a1(i) = (a1 .^ 3) - 2*a1 - 2;
diff1(i) = inf;
B1(i) = inf;
a1 = 2;
    
while abs(a1 - A1(i)) >= error
    i = i + 1;
    Iter1(i) = i;
    A1(i) = a1;
    f_a1(i) = (a1 .^ 3) - 2*a1 - 2;
    diff1(i) = A1(i) - A1(i - 1);
    a1 = a1 - (f_a1(i) * (A1(i) - A1(i - 1)) / (f_a1(i) - f_a1(i - 1)));
    B1(i) = a1;
end

Iter1 = round(Iter1,t);
A1 = round(A1,t);
f_a1 = round(f_a1,t);
diff1 = round(diff1,t);
B1 = round(B1,t);
Ans1 = [Iter1; A1; f_a1; diff1; B1]';

B1(1) = A1(2);

a2 = 0.5;
i = 1;
Iter2(i) = i;
A2(i) = a2;
f_a2(i) = (a2 .^ 3) - 2*a2 - 2;
diff2(i) = inf;
B2(i) = inf;
a2 = 1;
    
while abs(a2 - A2(i)) >= error
    i = i + 1;
    Iter2(i) = i;
    A2(i) = a2;
    f_a2(i) = (a2 .^ 3) - 2*a2 - 2;
    diff2(i) = A2(i) - A2(i - 1);
    a2 = a2 - (f_a2(i) * (A2(i) - A2(i - 1)) / (f_a2(i) - f_a2(i - 1)));
    B2(i) = a2;
end

Iter2 = round(Iter2,t);
A2 = round(A2,5);
f_a2 = round(f_a2,t);
diff2 = round(diff2,t);
B2 = round(B2,t);
Ans2 = [Iter2; A2; f_a2; diff2; B2]';

B2(1) = A2(2);

% a3 = 1;
% i = 1;
% Iter3(i) = i;
% A3(i) = a3;
% f_a3(i) = a3 .^ 6 - a3 - 1;
% diff3(i) = inf;
% B3(i) = inf;
% a3 = 1.5;
%     
% while abs(a3 - A3(i)) >= error
%     i = i + 1;
%     Iter3(i) = i;
%     A3(i) = a3;
%     f_a3(i) = a3 .^ 6 - a3 - 1;
%     diff3(i) = A3(i) - A3(i - 1);
%     a3 = a3 - (f_a3(i) * (A3(i) - A3(i - 1)) / (f_a3(i) - f_a3(i - 1)));
%     B3(i) = a3;
% end
% 
% Iter3 = round(Iter3,t);
% A3 = round(A3,t);
% f_a3 = round(f_a3,t);
% diff3 = round(diff3,t);
% B3 = round(B3,t);
% Ans3 = [Iter3; A3; f_a3; diff3; B3]';
% 
% T3 = array2table(Ans3,...
%     'VariableNames',{'Iteration' 'Current_X' 'Function_X' 'Difference' 'Next_X'});
% B3(1) = A3(2);
% 
% a4 = 1.5;
% i = 1;
% Iter4(i) = i;
% A4(i) = a4;
% f_a4(i) = a4 .^ 6 - a4 - 1;
% diff4(i) = inf;
% B4(i) = inf;
% a4 = 2;
%     
% while abs(a4 - A4(i)) >= error
%     i = i + 1;
%     Iter4(i) = i;
%     A4(i) = a4;
%     f_a4(i) = a4 .^ 6 - a4 - 1;
%     diff4(i) = A4(i) - A4(i - 1);
%     a4 = a4 - (f_a4(i) * (A4(i) - A4(i - 1)) / (f_a4(i) - f_a4(i - 1)));
%     B4(i) = a4;
% end
% 
% Iter4 = round(Iter4,t);
% A4 = round(A4,t);
% f_a4 = round(f_a4,t);
% diff4 = round(diff4,t);
% B4 = round(B4,t);
% Ans4 = [Iter4; A4; f_a4; diff4; B4]';
% 
% T4 = array2table(Ans4,...
%     'VariableNames',{'Iteration' 'Current_X' 'Function_X' 'Difference' 'Next_X'});
% B4(1) = A4(2);
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

a5 = 1;
b5 = 2;
i = 1;
c5 = (a5 + b5) / 2;

while b5 - c5 >= error
    A5(i) = a5;
    B5(i) = b5;
    C5(i) = (a5 + b5) / 2;
    f_c5(i) = (c5 .^ 3) - 2*c5 - 2;
    diff5(i) = b5 - c5;
    prod5(i) = ((a5 .^ 3) - 2*a5 - 2) * f_c5(i);
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

% a6 = 1;
% b6 = 2;
% i = 1;
% c6 = (a6 + b6) / 2;
%     
% while b6 - c6 >= error
%     A6(i) = a6;
%     B6(i) = b6;
%     C6(i) = (a6 + b6) / 2;
%     f_c6(i) = c6 .^ 6 - c6 - 1;
%     diff6(i) = b6 - c6;
%     prod6(i) = (a6 .^ 6 - a6 - 1) * f_c6(i);
%     i = i + 1;
%     
%     if prod6(i - 1) > 0
%         a6 = c6;
%         Check6(i - 1) = "a = c";
%     else
%         b6 = c6;
%         Check6(i - 1) = "b = c";
%     end
%     c6 = double((a6 + b6) / 2);
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

i = 1;
a7 = 2;
b7 = inf;
d7 = inf;

while abs(d7) >= error
    I7(i) = i;
    A7(i) = a7;
    F7(i) = (a7 .^ 3) - 2*a7 - 2;
    Fp7(i) = 3 * (a7 .^ 2) - 2;
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

figure(4);
plot(B7);
hold on;
plot(C5,'r');
title('Convergence towards Root ');
legend('Newton-Raphson','Bisection','Location',"best");
xlabel('Iteration No.');
ylabel('Root');
