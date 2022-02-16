%%(1)

load('ex4_data.mat')

%% (2)

f_left = [-inf f(1:end-1)];
f_right = [f(2:end) -inf];

mins = find(f<f_left & f<f_right);

%% (3)

plot(x,f)
hold on
plot(x(mins),f(mins),'*')
hold off