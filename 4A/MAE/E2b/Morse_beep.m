function [] = Morse_beep( pulse_seq, tone_freq, dot_duration, sampling_freq )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

dot_samples=dot_duration*sampling_freq;
pulses = repmat(pulse_seq, [dot_samples,1]);    %it replies the pulse_seq veticaly.

tone = reshape(pulses,[length(pulse_seq)*dot_samples,1]);   %now this is the pulse_seq terms repited 
tone = tone';   %it was vertical 

t=0:1/sampling_freq:(length(tone)/sampling_freq)-(1/sampling_freq);
tone_final = tone.*cos(2*pi*tone_freq*t);
sound(tone_final,sampling_freq);
    
end

