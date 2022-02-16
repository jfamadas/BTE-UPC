function [ y , x ] = Channel_coder( letter, trellis )
%Channel_coder    Codifies the channel using a convolutional code
%
%Channel_coder(letter, trellis) transforms the letter into a 8 bits array and
%adds 2 extra bits in order to codify it using a convolutional code defined
%by the input trellis. Returns the code and the letter into bits.

x = [flip(de2bi(1*letter,8)) 0 0];
%converts de letter into a decimal with 8 bits, then into a binary number and finaly
%flips it to put in the order we work with. it adds 2 zeros because we have
%2 registers and we want to empty them.

y = convenc(x,trellis);


end