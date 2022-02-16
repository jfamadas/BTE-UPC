%% (1)

P = [2 1;2.5 3;1 2];
R = [1.5 1 2];
syms x y
f1 = '(x-2)^2+(y-1)^2=1.5^2';
f2 = '(x-2.5)^2+(y-3)^2=1^2';
f3 = '(x-1)^2+(y-2)^2=2^2';
ezplot(f1)
axis equal;
hold on;
ezplot(f2)
ezplot(f3)
title('GPS');
axis([-2 4 -1 5]);


%% (2)

inici = [0 0];
inici23=[2,3];

inter12 = @Equations12;
x12 = fsolve(inter12,inici);
plot(x12(1),x12(2),'o');

inter13 = @Equations13;
x13 = fsolve(inter13,inici);
plot(x13(1),x13(2),'o');

inter23 = @Equations23;
x23 = fsolve(inter23,inici23);
plot(x23(1),x23(2),'o');

inter123 = @Equations123;
x123 = fsolve(inter123,inici);
plot(x123(1),x123(2),'o');

x = P(1:end,1);
y = P(1:end,2);
plot(x,y,'*');
