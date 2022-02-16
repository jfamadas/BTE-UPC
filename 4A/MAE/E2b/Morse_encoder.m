function [ dashdot_seq, pulse_seq ] = Morse_encoder( input_string )
%UNTITLED Summary of this function goes here
%   Dot                => '1'
%   Dash               => '111'
%   Separator Dot/Dash => '0'
%   Next letter        => '000'
%   Next word          => '0000000' (7 0s)

load('morse.mat');
str = upper(input_string);
string = '';


for i=1:length(str)
    
    switch str(i)
        case ' '
            string = [string, '  '];      %2 spaces that will be converted in 7 later
        otherwise
            string = [string, ' ', char(Morse(find(Alpha==str(i))))]; %1 space that will be converted in 3 later
    end

end

dashdot_seq = blanks(2*length(string)-1); % this is to make the space for ' '
dashdot_seq(1:2:end) = string;          %we add the text leaving the spaces




str2 = dashdot_seq;
str2 = strrep(str2,' ','0');
str2 = strrep(str2,'.','1');
str2 = strrep(str2,'-','111');

pulse_seq = str2 - '0';

end
