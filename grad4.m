function g=grad4(x)
g=zeros(2,1);
g(2)=200*(x(2)-x(1)^2);
g(1)=2*(1-x(1))-400*x(1)*(x(2)-(x(1)^2));
end