function [ theta_values, gain_values ] = compute_gain( d_norm, a, Npoints )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

theta_values = -pi:2*pi/(Npoints-1):pi;
Psi_values = 2*pi*d_norm*cos(theta_values);
gain_values = abs(compute_AF(a,Psi_values));


end

