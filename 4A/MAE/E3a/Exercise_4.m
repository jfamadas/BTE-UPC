%% (1) 

[signal,Fs] = audioread('morse.wav');
dot_duration = 0.065;
tone_frequency = 700;
sampling_frequency = 8000;

%% (2)

sound(signal,Fs);

plot(signal(1:4000));

%% (3)
N = 4000;
x = signal(1:4000);

M=4*512;
K=N/M;
w=triang(M);
Sxx=zeros(1,M);
for i=1:K
    xi=x( (i-1)*M+1 : i*M )'.*w';
    Xi=fft(xi);
    Sxxi=(abs(Xi).^2)/M;
    Sxx=Sxx+Sxxi;
end
Sxx=Sxx/K;

f = linspace(0,Fs/2,M/2);
plot(f,10*log10(Sxx(1:M/2)));

%% (4)

t = linspace(0,(length(signal)-1)/Fs,length(signal));
sinus = sin(2*pi*700*t);

fx = sinus'.*signal;
dig_BW=5/(dot_duration*Fs);
fil = fir1(64,dig_BW);

fx_BB = filter(fil,1,fx);
stairs(fx_BB);


%% (5)

deriv = diff(fx_BB);
plot(deriv)



