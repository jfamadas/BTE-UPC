
figure(1)
axis([0 16 0 16])
hold on;
%A
Xa = [0 0 8];
Ya = [8 16 16];
fill(Xa,Ya,'g')
text(sum(Xa)/length(Xa),sum(Ya)/length(Ya),'A','FontSize',20,'Color','k')

%B
Xb = [4 8 12 8];
Yb = [12 16 12 8];
fill(Xb,Yb,'c')
text(sum(Xb)/length(Xb),sum(Yb)/length(Yb),'B','FontSize',20,'Color','b')

%C
Xc = [8 16 12];
Yc = [16 16 12];
fill(Xc,Yc,'y')
text(sum(Xc)/length(Xc),sum(Yc)/length(Yc),'C','FontSize',20,'Color','k')

%D
Xd = [0 4 4 0];
Yd = [8 12 4 0];
fill(Xd,Yd,'m')
text(sum(Xd)/length(Xd),sum(Yd)/length(Yd),'D','FontSize',20,'Color','g')

%E
Xe = [4 4 8];
Ye = [4 12 8];
fill(Xe,Ye,'r')
text(sum(Xe)/length(Xe),sum(Ye)/length(Ye),'E','FontSize',20,'Color','y')

%F
Xf = [8 16 16];
Yf = [8 16 0];
fill(Xf,Yf,'b')
text(sum(Xf)/length(Xf),sum(Yf)/length(Yf),'F','FontSize',20,'Color','k')

%G
Xg = [0 8 16];
Yg = [0 8 0];
fill(Xg,Yg,'k')
text(sum(Xg)/length(Xg),sum(Yg)/length(Yg),'G','FontSize',20,'Color','w')

hold off;

% Second part

figure(2)

hold on;

%A
Xa2 = Xa-3;
Ya2 = Ya+3;
fill(Xa2,Ya2,'g')
text(sum(Xa2)/length(Xa2),sum(Ya2)/length(Ya2),'A','FontSize',20,'Color','k')

%B
Xb = [4 8 12 8];
Yb = [12 16 12 8];
fill(Xb,Yb,'c')
text(sum(Xb)/length(Xb),sum(Yb)/length(Yb),'B','FontSize',20,'Color','b')

%C
Yc2 = Yc+4;
fill(Xc,Yc2,'y')
text(sum(Xc)/length(Xc),sum(Yc2)/length(Yc2),'C','FontSize',20,'Color','k')

%D
Xd2 = -Yd;
Yd2 = Xd;
D = fill(Xd2,Yd2,'m');
text(sum(Xd2)/length(Xd2),sum(Yd2)/length(Yd2),'D','FontSize',20,'Color','g')

%E
Xe = [4 4 8];
Ye = [4 12 8];
fill(Xe,Ye,'r')
text(sum(Xe)/length(Xe),sum(Ye)/length(Ye),'E','FontSize',20,'Color','y')

%F
Xf2 = Xf+3;
Yf2 = Yf-3;
fill(Xf2,Yf2,'b')
text(sum(Xf2)/length(Xf2),sum(Yf2)/length(Yf2),'F','FontSize',20,'Color','k')

%G
Xg2 = Xg+3;
Yg2 = Yg-3;
fill(Xg2,Yg2,'k')
text(sum(Xg2)/length(Xg2),sum(Yg2)/length(Yg2),'G','FontSize',20,'Color','w')




