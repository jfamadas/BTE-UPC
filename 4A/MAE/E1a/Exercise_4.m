%% (1), (2) & (3)

v = [0.1+0.3*1i 0.1-0.3*1i 0.5 -1];
coef = poly(v);

w = -pi:pi/200:pi;
z = exp(1i*w);
x = polyval(coef,z);

plot(w,10*log10(abs(x)))
xlabel('w (rad)')
ylabel('System response (dB)')
axis([-4 4 -3 3])