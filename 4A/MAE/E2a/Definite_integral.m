function [ integral ] = Definite_integral( x, fx )
%Calculates the definite integral of f(x) between x(1) and x(end).

n = length(x);
delta = (x(end)-x(1))/(n-1);

comp = sum(mod((x-x(1)),delta));

if (comp~=0)
    disp('ERROR: Not equispaced X');
    return
elseif (mod(n,2)==0)
    disp('ERROR: The number of samples is not odd');
    return
end

v = 4*ones(1,n);
v(1:2:end) = 2;
v(1)= 1;
v(n)= 1;

integral = delta/3 * sum(fx .* v);

end

