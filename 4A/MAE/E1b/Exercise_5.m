%% (1)
N = 50;

x = round(100*rand(1,N));
y = round(100*rand(1,N));

plot(x,y,'O r')
hold on;
%% (2)

[X1,X2] = meshgrid(x,x);
[Y1,Y2] = meshgrid(y,y);

D = sqrt((X2-X1).^2+(Y2-Y1).^2);

%% (3)

Dmax = 15;
[F,C] = find(D<=Dmax);
Mx = [x(F);x(C)];
My = [y(F);y(C)];


plot(Mx,My,'b');

%% (4)

D1 = D + diag(inf*ones(1,N)); %infinits a la diagonal
Mins = min(D1,[],1); %minim de cada columna

D2 = D1-repmat(Mins,N,1); %Posem 0 a les connexions que són les mes petites en la columna
[F1,C1] = find(D2==0);
Mx1 = [x(F1);x(C1)];
My1 = [y(F1);y(C1)];

plot(Mx1,My1,'g','Linewidth',3);





