% (6)

a1 = [1 1 1 1];
a2 = [1 exp(1i*3*pi/4) exp(1i*6*pi/4) exp(1i*9*pi/4)];
d_norm = 1/2;
Npoints = 10001;
min_dB = -20;

[theta_values, gain_values] = compute_gain(d_norm, a2, Npoints);

%Linear
figure(1)
plot(2*pi*d_norm*cos(theta_values),gain_values);
grid on;

%Polar (dB)
figure(2)
polardB(theta_values, gain_values, min_dB);

%Parameters
radiation_pattern_parameters( theta_values, gain_values);


