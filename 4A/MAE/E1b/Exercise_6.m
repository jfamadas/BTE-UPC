%% (1)

theta = 0:pi/200:5*pi;
f1 = theta/pi.*sin(theta);
f2 = theta/pi.*cos(theta);

plot3(f1,f2,theta)
axis([min([f1,f2]),max([f1,f2]),min([f1,f2]),max([f1,f2]),min(theta),max(theta)]);
xlabel('f_1(\theta)');
ylabel('f_2(\theta)');
zlabel('\theta');
grid on;

%% (2)

[X2,X1] = meshgrid(-4:1/200:4);

theta = 0:pi/200:5*pi;
f1 = theta/pi.*sin(theta);
f2 = theta/pi.*cos(theta);

for i = 1:length(X1)
    
    for j = 1:length(X2)
    
        A = ((X1(i,j)-f1).^2+(X2(i,j)-f2).^2);
        c = min(min(A));
        Xc(i,j) = theta(find(A==c));
    end
    i/length(X1)*100 %this is just to see the percentatge of completition and avoid waiting too much.
end 

figure(1)
mesh(X1,X2,Xc)
xlabel('X_1')
ylabel('X_2')
zlabel('X_c')
grid on;

figure(2)
mesh(X1,X2,-Xc)
xlabel('X_1')
ylabel('X_2')
zlabel('-X_c')
grid on;