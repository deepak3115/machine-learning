function g=grad1(x)
g=zeros(2,1);
g(1)=0.004*(x(1)^3)+3;
g(2)=0.004*(x(2)^3)+2;
end