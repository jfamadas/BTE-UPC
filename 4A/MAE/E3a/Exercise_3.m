%% (1)

zeros = 2;
poles = [1, 0.25, 1];

H = tf(zeros,poles);
figure(1)
impulse(H,(1:0.01:40))

%% (2)
figure(2)
step(H,(1:0.01:40))
