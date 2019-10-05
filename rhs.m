function y= rhs (t,u)
  y=zeros(length(u),1);
  global q m
  Ex=5;
  g=9.8;
  Ey=0;
  Ez=0;
  Bx=5;
  By=0;
  Bz=0;
  wx=q/m*(Bx);
  wy=q/m*(By);
  wz=q/m*(Bz);
  
  y(1)=q*Ex/m+(wz*u(2)-wy*u(3));
  y(2)=q*Ey/m+(wx*u(3)-wz*u(1));
  y(3)=q*Ez/m+(wy*u(1)-wx*u(2))-g;
  y(4)=u(1);
  y(5)=u(2);
  y(6)=u(3);
  
endfunction
