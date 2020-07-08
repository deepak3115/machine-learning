function g=grad2(x)
g=zeros(3,1);
g(1)=4*x(1)*(x(1)^2 + x(2)^2) - 2*x(1);
g(2)=4*x(2)*(x(1)^2 + x(2)^2) - 1;
g(3)=2*x(3);
end