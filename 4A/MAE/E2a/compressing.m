function [ fbv, burst_length, bin_compressed ] = compressing( sequence, n_bits )
%Compress a sequence of bits in agrupation of bit bursts

fbv = sequence(1);

seq2 = [sequence(2:end), -1];
dif = find(sequence~=seq2);

burst_length = [dif(1) , dif(2:end)-dif(1:end-1)];

bin_compressed = [fbv, d2b_conversion(burst_length,n_bits)]; 


end

