%differential Binary Phase Shift Keying (Quadrature)

clc;
close all;
clear all;
bits=randi([0 1],1,1000);

c=[zeros(1,1000)];
c(1)=xor(0,bits(1));
for i=2:1000
    c(i)=xor(c(i-1),bits(i));
end
noise=randn(1,11000);
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

error=[];
for i=1:length(bits)
    if bits(i)==1
        trans=[trans s1];
    else
        trans=[trans s2];
    end
end
plot(trans);
xlim([0 20]);

dv=10;
v1=1:dv:10000;
for i=1:length(v1)
    vv(i)=1/v1(i);
end
for v=1:dv:10000
    k=1;
    tran=(v)*noise+trans;
    ans=zeros(length(bits),1);
    for i=1:11:length(trans)
        r1=(tran(i:i+10).*s3);
        r2=(tran(i:i+10).*s4);
        r3=(tran(i:i+10).*s5);
        r4=(tran(i:i+10).*s6);
        sum1=(sum(r1))^2+(sum(r2))^2;
        sum2=(sum(r3))^2+(sum(r4))^2;
        if sum1>sum2
            ans(k)=1;
        else
            ans(k)=0;
        end
        k=k+1;
    end
    ans=ans';
    count=0;
    for i=1:length(ans)
        if ans(i)~=bits(i)
            count=count+1;
        end
    end
    err=count/length(bits);
    
    error=[error err];
    %error=error/v;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
plot(trans);
xlim([0 20]);

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
error1=[];

for v=1:dv:10000
    ans1=zeros(1,length(c));
    k=1;
    tran1=(v)*noise+trans;
    for i=1:11:length(trans)
        r1=(tran1(i:i+10).*s1);
        r2=(tran1(i:i+10).*s2);
        r3=(tran1(i:i+10).*s3);
        r4=(tran1(i:i+10).*s4);
        sum1=(sum(r1))^2+(sum(r3))^2;
        sum2=(sum(r2))^2+(sum(r4))^2;
        if sum1>sum2
            ans1(k)=1;
        else
            ans1(k)=0;
        end
        k=k+1;
    end
    decode=zeros(1,length(ans));
    decode(1)=ans1(1);
for i=2:length(ans)
    decode(i)=xor(decode(i-1),ans1(i));
end

    count=0;
    for i=1:length(ans1)
        if bits(i)~=decode(i)
            count=count+1;
        end
    end
    err1=count/length(c);
    error1=[error1 err1];
   
end

plot(v1,error,v1,error1);
xlabel('Variance');
ylabel('Bit error probability');
legend('OFSK','BDPSK');