clc;
close all;
clear all;
x=rand(2,1);
I=eye(2);
mu=rand(1);
disp('Levenberg - Marquardt Damped Newton (LMDN) METHOD');
fprintf('iteration\tx(1)\tx(2)\tgradient1\tgradient2\t\th(1)\t\th(2)\t\tf(x)\t\tf(x+h)\n');
for i=1:100
    f=f3(x);
    g=grad3(x);
    H=hes3(x);
    func(i)=f;
    gradient(i)=norm(g);
  if min(eig(H))<0
    B=H+mu*I;
    while min(eig(B))<0
        mu=2*mu;
        B=H+mu*I;
    end
   h=-B\g;
else
    h=-H\g;
  end
  z=f3(x+h);
  q=f+ h'*g;
  r=(f-z)/(f-q);
  if r>0
      mu= mu*max(1/3,1-(2*r-1)^3);
  else
      mu=2*mu;
  end
  if norm(g)<=1e-5
      break
  end
   fprintf('%d\t%10.4f\t%10.4f\t%10.6f\t%10.6f\t%10.4f\t%10.4f\t%10.4f\t%10.4f\n',i,x(1),x(2),g(1,1),g(2,1),h(1,1),h(2,1),f,z);
x=x+h;
end
c= 1:i;
plot(c,func,'r');
hold on;
plot(c,gradient,'b');
hold on;
grid on;
legend('Function VS Iteration','Norm of grad VS Iteration');
title('Levenberg - Marquardt Damped Newton (LMDN) METHOD');
   