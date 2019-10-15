%Binary Frequency Phase Shift Keying Ortogonal(OFSK)

clc;
close all;
clear all;
bits=randi([0 1],1,1000);

E=1;
T=10^-6;
f1=10^6;
w1=2*pi*f1;
w2=w1-pi/T;

f2=w2/(2*pi);
fs=10*max(f1,f2);

dt=1/fs;
trans=[];
t=0:dt:T;
phase=1;
s1=sqrt(2/T)*cos(w1*t+phase);
s2=sqrt(2/T)*cos(w2*t);
s3=cos(w1*t);
s4=sin(w1*t);
s5=cos(w2*t);
s6=sin(w2*t);

for i=1:length(bits)
    if bits(i)==1
        trans=[trans s1];
    else
        trans=[trans s2];
    end
end
% plot(trans);
% xlim([0 20]);

k=1;
ans=zeros(length(bits),1);
for i=1:11:length(trans)
    r1=(trans(i:i+10).*s3);
    r2=(trans(i:i+10).*s4);
    r3=(trans(i:i+10).*s5);
    r4=(trans(i:i+10).*s6);
    sum1=(sum(r1))^2+(sum(r2))^2;
    sum2=(sum(r3))^2+(sum(r4))^2;
    if sum1>sum2
        ans(k)=1;
    else
        ans(k)=0;
    end
    k=k+1;
end

count=0;
for i=1:length(ans)
    if ans(i)~=bits(i)
        count=count+1;
    end
end
disp("Error probability in OFSK:");
disp(count/length(bits));
