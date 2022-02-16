function [ F ] = Equations( th, delta_th )
%(th(1)=alpha th(2)=th_g th(3)=th_e)
he = 400e3;
hg = 36e6;
rt = 6371e3;

F = zeros(1,3);
F(1) = tan(th(1))*sin(th(2))*(hg+rt)+rt-cos(th(2))*(hg+rt);
F(2) = tan(th(1))*sin(th(3))*(he+rt)+rt-cos(th(3))*(he+rt);
F(3) = th(2)+th(3)-delta_th;

end

