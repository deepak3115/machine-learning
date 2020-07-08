function H=hes1(x)
H = zeros(2,2);
H(1,1) = 0.012*x(1)^2 ;
H(1,2) = 0;
H(2,1) = 0;
H(2,2) = 0.012*x(2)^2;
end