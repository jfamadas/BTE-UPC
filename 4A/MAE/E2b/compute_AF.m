function [ AF_values ] = compute_AF( a, Psi_values )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

n = 0:(length(a)-1);

A = zeros(1,length(Psi_values));

for i = 1:length(Psi_values)
    
    A(i) = sum(a.*exp(1i*n*Psi_values(i)));
       
end
    
AF_values = A; 


end

