th = zeros(160/2+1,3);
he = 400e3;
hg = 36e6;
rt = 6371e3;
for i = 0:260
    
    delta_th = i*pi/180;
    sol = @(th)Equations (th,delta_th);
    th(i+1,:) = fsolve(sol,[0,0,0]);

end
delta_th=0:160/2;
dg=sqrt(rt^2+(rt+hg)^2-2*rt*(rt+hg)*cos(th(:,2)));
figure(1)
plot(th(:,2)*180/pi,dg)
% display(['Theta g = ',num2str(180*th(2)/pi),...
%     'º ;    Theta e = ',num2str(180*th(3)/pi),...
%     'º;    Incidence angle = ',num2str(180*th(1)/pi),'º;']);
