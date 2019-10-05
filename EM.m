close all;
clear all;
clc;

t_start=0;
dt=0.01;
t_final=10;

u0=zeros(6,1);

u0(1)=5;
u0(2)=5;
u0(3)=5;

u0(4)=0;
u0(5)=0;
u0(6)=0;
global q=5
global m=5
[t,u]=ode45(@rhs,[t_start:dt:t_final],u0);

figure(1)
plot3(u(:,1),u(:,2),u(:,3),u(1,1),u(1,2),u(1,3),'r+');
xlabel('Vx');
ylabel('Vy');
zlabel('Vz');
title('Velocity of particle in EM field');

figure(2)
plot3(u(:,4),u(:,5),u(:,6),u(1,4),u(1,5),u(1,6),'r+');
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Motion of particle in EM field');

V=sqrt(u(:,1).^2+u(:,2).^2+u(:,3).^2);
figure(3)
plot(t,0.5*m*V.^2);
title('Kinetic Energy of the particle');