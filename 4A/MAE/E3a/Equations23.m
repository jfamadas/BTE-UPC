function [F] = Equations23( x )
F = zeros(1,2);
F(1) = (x(1)-2.5).^2+(x(2)-3).^2-1.^2;
F(2) = (x(1)-1).^2+(x(2)-2).^2-2.^2;
end