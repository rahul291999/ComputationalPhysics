function du=rhs1(t,u)
global g;
global l;
du=zeros(2,1);
du(1)=u(2);
du(2)=-1*u(1)*g/l;
end