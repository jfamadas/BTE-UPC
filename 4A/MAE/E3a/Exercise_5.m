%% (1)

load('data5.mat');
figure(1)
plot(U,V,'o');
p = polyfit(U,V,1);

V1 = polyval(p,U);
hold on;
plot(U,V1);
title('order = 1');
hold off;
err1 = norm(V1-V)

%% (2)

figure(2)
plot(U,V,'o');
p = polyfit(U,V,2);

V2 = polyval(p,U);
hold on;
plot(U,V2);
title('order = 2');
hold off;
err2 = norm(V2-V)

figure(3)
plot(U,V,'o');
p = polyfit(U,V,3);

V3 = polyval(p,U);
hold on;
plot(U,V3);
title('order = 3');
hold off;
err3 = norm(V3-V)
