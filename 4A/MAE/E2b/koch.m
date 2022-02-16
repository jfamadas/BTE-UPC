function [ M ] = koch( n )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

M1 = [0 0; 1/3 0; 1/2 sin(pi/3)/3; 2/3 0; 1 0];
M1x = M1(:,1);
M1y = M1(:,2);
Fx2 = M1x;
Fy2 = M1y;

for i=1:n

    Fx=Fx2;
    Fy=Fy2;
    u0 = Fx(1:4:end-1);
    u1 = Fx(5:4:end);
    v0 = Fy(1:4:end-1);
    v1 = Fy(5:4:end);

    for j = 1:4
    Fx(j:4:end-1) = u0+(u1-u0)*M1x(j)-(v1-v0)*M1y(j);
    Fy(j:4:end-1) = v0+(v1-v0)*M1x(j)+(u1-u0)*M1y(j);
    end

Fx2=zeros(length(Fx)*4-3,1);
Fy2=zeros(length(Fy)*4-3,1);

Fx2(1:4:end)=Fx;
Fy2(1:4:end)=Fy;


end

if n == 0
    
    M = [0 0; 1 0];

else
    
    M = [Fx,Fy];
end

if nargout == 0
    plot(Fx,Fy);
    axis equal;
end 
end

