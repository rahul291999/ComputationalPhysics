clc;
clear all;
close all;

l=1;
g=9.8;
T=2*pi*sqrt(l/g);
dt=T/1000;
simut=100*T;
npoints=round(simut/dt);
omega=zeros(npoints);
theta=zeros(npoints);
time=zeros(npoints);
theta(1)=0.2;
for step=1:npoints-1
  omega(step+1)=omega(step)-(g/l)*dt*theta(step);
  theta(step+1)=theta(step)+omega(step+1)*dt;
  time(step+1)=time(step)+dt;
endfor
theta=57.5*theta;
plot(time,theta);