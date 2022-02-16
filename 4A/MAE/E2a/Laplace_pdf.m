function [ laplace ] = Laplace_pdf( x, b, mu )
%Calculates the Laplace probability density function in 'x' with the
%parameters 'b' and 'mu'.
laplace = 1/(2*b).*exp(-abs(x-mu)/b);

end

