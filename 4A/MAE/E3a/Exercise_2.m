%% (1)

w = [0, 1, 2, 5, inf];
zeros = 3;
poles = [1 5 6 0];

G = freqs(zeros,poles,w);
 
mags = abs(G)
args = angle(G)

%% (2)
w = logspace(-1,5);
G2 = tf(zeros,poles);
bode(G2,w);

%% (3)

w=logspace(-1,1);
nyquist(G2,w)


