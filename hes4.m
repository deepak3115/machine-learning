function h=hes4(x)
h=zeros(2,2);

h(2)=-400*x(1);
h(3)=-400*x(1);
h(1)=1200*x(1)^2 - 400*x(2) - 2;
h(4)=200;

end