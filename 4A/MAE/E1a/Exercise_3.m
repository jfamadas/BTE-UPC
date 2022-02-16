%% (1), (2) & (3)

x = 0:pi/200:5*pi;
f1 = x/pi.*sin(x);
f2 = x/pi.*cos(x);

subplot(1,2,1);
plot(x,f1);
xlabel ('x');
ylabel ('f1(x), f2(x)');
title ('Horizontal/Vertical spiral components');
hold on
plot(x,f2);
grid on;
hold off
subplot(1,2,2);
plot(f1,f2);
xlabel ('f1(x)');
ylabel ('f2(x)');
title ('Archimedes Spiral');
grid on;
axis equal;



