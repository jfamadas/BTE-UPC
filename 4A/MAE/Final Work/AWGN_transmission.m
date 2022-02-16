function [ ACK ] = AWGN_transmission( package, snr )
%AWGN_transmission    Transmission through an AWGN channel
%
%AWGN_transmission(package) simulates an AWGN channel and sends the package
%through it, if the package is receiver correctly returns 1 and if not,
%returns 0.

y = package;

z = awgn(y,snr); %AWGN noise addition
yr = z>0.5; %Hard decision

ACK = isequal(y,yr);
% display(ACK);

end

