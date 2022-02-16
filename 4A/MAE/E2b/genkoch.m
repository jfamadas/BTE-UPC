function [ M ] = genkoch( n, M1 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

M1x = M1(:,1);
M1y = M1(:,2);
Fx2 = M1x;
Fy2 = M1y;

for i=1:n

    Fx=Fx2;
    Fy=Fy2;
    u0 = Fx(1:length(M1)-1:end-1);
    u1 = Fx(length(M1):length(M1)-1:end);
    v0 = Fy(1:length(M1)-1:end-1);
    v1 = Fy(length(M1):length(M1)-1:end);

    for j = 1:length(M1)-1
    Fx(j:length(M1)-1:end-1) = u0+(u1-u0)*M1x(j)-(v1-v0)*M1y(j);
    Fy(j:length(M1)-1:end-1) = v0+(v1-v0)*M1x(j)+(u1-u0)*M1y(j);
    end

Fx2=zeros((length(Fx)-1)*(length(M1)-1)+1,1);
Fy2=zeros((length(Fy)-1)*(length(M1)-1)+1,1);

Fx2(1:length(M1)-1:end)=Fx;
Fy2(1:length(M1)-1:end)=Fy;

if nargout == 0
    figure(1)
    subplot(n,1,i);
    plot(Fx,Fy);
    axis equal;
    axis off;
end 
    
end

if n == 0
    
    M = [0 0; 1 0];

else
    
    M = [Fx,Fy];
end


end

