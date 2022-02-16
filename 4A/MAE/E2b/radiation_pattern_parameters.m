function [] = radiation_pattern_parameters( theta_values, gain_values )
%UNTITLED4 Summary of this function goes here
%   theta_max = maximum gain direction
%   delta_theta = beamwidth
%   D = Directivity

    theta_max = theta_values(find(gain_values==max(gain_values)))
    
    main_lobe = theta_values(find(gain_values>=max(gain_values)/sqrt(2)));
    main_lobe = main_lobe(1:end/length(theta_max));
    delta_theta = main_lobe(end)-main_lobe(1)
    
    
    x = theta_values(theta_values>=0);
    fx = gain_values(theta_values>=0).^2.*sin(x);
    integral = Definite_integral(x,fx);
    D = 2*max(gain_values)^2/integral
    



end

