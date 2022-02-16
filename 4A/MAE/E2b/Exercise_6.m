%% (3)

text = 'Nuria Martin Atahona'
dot_duration = 0.05;
t_f = 900;
s_f = 8000;

[dashdot_seq, pulse_seq] = Morse_encoder(text);

dashdot_seq

Morse_beep(pulse_seq, t_f, dot_duration, s_f);
