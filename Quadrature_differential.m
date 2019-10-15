%non coherent DBPSK
clc;
close all;
clear all;
bits=randi([0 1],1,1000);
c=[zeros(1,1000)];
c(1)=xor(0,bits(1));
for i=2:1000
    c(i)=xor(c(i-1),bits(i));
end
f=10^6;
fs=10*f;
dt=1/fs;
T=1/f;
w=2*pi*f;

t=0:dt:T;

s1=cos(w*t+pi);
s2=cos(w*t);
s3=sin(w*t+pi);
s4=sin(w*t);
trans=[];

for i=1:length(c)
    if mod(i,2)==1
        if c(i)==1
            trans=[trans s1];
        else
            trans=[trans s2];
        end
    else
        if c(i)==1
            trans=[trans s3];
        else
            trans=[trans s4];
        end
        
    end
end
% plot(trans);
% xlim([0 20]);

k=1;
ans=zeros(length(bits),1);
% for i=1:11:length(trans)
%     r1=conv(trans(i:i+10),s1);
%     r2=conv(trans(i:i+10),s2);
%     if r1>=r2
%         ans(k)=1;
%     else
%         ans(k)=0;
%     end
%     k=k+1;
% end

k=1;
ans=zeros(length(bits),1);
for i=1:11:length(trans)
    r1=(trans(i:i+10).*s1);
    r2=(trans(i:i+10).*s2);
    r3=(trans(i:i+10).*s3);
    r4=(trans(i:i+10).*s4);
    sum1=(sum(r1))^2+(sum(r3))^2;
    sum2=(sum(r2))^2+(sum(r4))^2;
    if sum1>sum2
        ans(k)=1;
    else
        ans(k)=0;
    end
    k=k+1;
end

count=0;
for i=1:length(ans)
    if ans(i)~=c(i)
        count=count+1;
    end
end

disp("Error probability in DBPSK:");
disp(count/length(bits));
