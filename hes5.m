function h=hes5(x)
x=abs(x);
h=zeros(2,2);
x1=x(1);
x2=x(2);
h(2)=1/(x1 + x2 - 1)^2;
h(3)=1/(x1 + x2 - 1)^2;
h(1)=1/(x1 + x2 - 1)^2 + 1/x1^2;
h(4)=1/(x1 + x2 - 1)^2 + 1/x2^2;

end