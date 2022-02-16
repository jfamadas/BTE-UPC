function [] = polardB( theta_values, gain_values, min_db )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

gain_values_db = 20*log10(gain_values/max(gain_values));

gain_values_db = max(gain_values_db, min_db);
polarplot(theta_values,gain_values_db);
rlim([min_db,0]);

end

