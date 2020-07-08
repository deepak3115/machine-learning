clc;
close all;
clear all;
e=rand(3,1);
x=e;
disp('LINEAR SEARCH');
fprintf('iteration\tx(1)\tx(2)\tx(3)\tgradient1\tgradient2\tgradient3\t\th(1)\t\th(2)\t\th(3)\t\tf(x)\t\tf(x+(alpha)h)\n');
for i=1:100
    f=f2(x);
    g=grad2(x);
    H=hes2(x);
    h=-g;
    alpha= -(h'*g)/(h'*H*h);
  falpha = f + (alpha*(h'*g));
    func(i)=f;
    gradient(i)=norm(g);
     if norm(g)<1e-5
        break
     end
    fprintf('%d\t%10.4f\t%10.4f\t%10.4f\t%10.6f\t%10.6f\t%10.6f\t%10.4f\t%10.4f\t%10.4f\t%10.4f\t%10.4f\n',i,x(1),x(2),x(3),g(1),g(2),g(3),h(1),h(2),h(3),f,falpha);
 x= x+ alpha*(h);
end
c= 1:i;
subplot(2,1,1);
plot(c,func,'r');
hold on;
plot(c,gradient,'b');
hold on;
grid on;
legend('Function VS Iteration','Norm of grad VS Iteration');
title('LINEAR SEARCH METHOD');

x=e;
fprintf('\nTRUSTED REGION\n');
fprintf('iteration\tx(1)\tx(2)\tx(3)\tgradient1\tgradient2\tgradient3\t\th(1)\t\th(2)\t\th(3)\t\tf(x)\t\tf(x+h)\n');
h=-grad2(x);
for i=1:100
    f=f2(x);
    g=grad2(x);
    z=f2(x+h);
    q=f+ h'*g;
    r=(f-z)/(f-q);
    func1(i)=f;
    gradient1(i)=norm(g);
     fprintf('%d\t%10.4f\t%10.4f\t%10.4f\t%10.6f\t%10.6f\t%10.6f\t%10.4f\t%10.4f\t%10.4f\t%10.4f\t%10.4f\n',i,x(1),x(2),x(3),g(1),g(2),g(3),h(1),h(2),h(3),f,z);
    if r>0.75
        h=2*h;
    else if r<0.25
            h=h/3;
     else if norm(g)<1e-5
        break;
     else x=x+h;
            h=-grad2(x);
        end
    end
    end
end
d=1:i;
subplot(2,1,2);
plot(d,func1,'r');
hold on;
plot(d,gradient1,'b');
hold on;
grid on;
legend('Function VS Iteration','Norm of grad VS Iteration');
title('TRUSTED REGION METHOD');