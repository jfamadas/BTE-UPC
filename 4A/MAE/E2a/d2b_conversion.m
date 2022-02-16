function [ bin_list ] = d2b_conversion( int_list, n_bits )
%transform an array of integers into blocks of n_bits


%comprovation
if (~isempty(find(int_list>2^n_bits)))
    disp('ERROR: Some bits are out of range');
    return
end
    

A = zeros(1,length(int_list)*n_bits);

for i = 0:1:(n_bits-1)
    
    A(n_bits-i:n_bits:end-i) = mod(floor((int_list-1)/(2^i)),2);
    
    
end

bin_list=A;
end

