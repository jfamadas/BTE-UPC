%%(3)
x = 1:1:101;
b = 4;
mu = 2;

fx0 = Laplace_pdf(x, b, mu);
fx = fx0.*log(fx0);
entr = -1 * Definite_integral(x,fx)