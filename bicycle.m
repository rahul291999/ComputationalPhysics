clc;
clear all;

init_vel=5;
time_p=300;
dt=1;
npoints=time_p/dt;

time=zeros(npoints,1);
speed=zeros(npoints,1);

time(1)=0;
speed(1)=init_vel;
mass=50;
power=400;

constant=0.5;
density=1.225;
area=0.33;

for step=1:npoints-1
  speed(step+1)=speed(step)+power*density/(mass*speed(step))-constant*density*area*(speed(step).^2)/(2*mass);
  time(step+1)=time(step)+dt;
endfor
plot(time,speed);