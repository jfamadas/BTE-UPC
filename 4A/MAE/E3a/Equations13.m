function [F] = Equations13( x )
F = zeros(1,2);
F(1) = (x(1)-2).^2+(x(2)-1).^2-1.5.^2;
F(2) = (x(1)-1).^2+(x(2)-2).^2-2.^2;
end

