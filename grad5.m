function g=grad5(x)
x=abs(x);
g=zeros(2,1);
g(1)=- 1/(x(1) + x(2) - 1) - 1/x(1);
g(2)=- 1/(x(1) + x(2) - 1) - 1/x(2);
end