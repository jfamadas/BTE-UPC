%% (4)

a1 = [1 1 1 1];
a2 = [1 exp(1i*3*pi/4) exp(1i*6*pi/4) exp(1i*9*pi/4)];
d_norm = 1/2;
Npoints = 1000;

[theta_values, gain_values] = compute_gain(d_norm, a1, Npoints);

figure(1)
plot(2*pi*d_norm*cos(theta_values),gain_values);
grid on;


