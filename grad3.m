function g=grad3(x)
g=zeros(2,1);
g(1)=0.52*x(1)-0.48*x(2);
g(2)=0.52*x(2)-0.48*x(1);
end