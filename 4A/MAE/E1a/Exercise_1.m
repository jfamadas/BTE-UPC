%% (1)Factorial

n = 5;
f = prod(2:1:n)

%% (2)Pascal triangle    

n = length(v);
r(1) = 1;
r(n+1) = 1;
for i = 2:n
    
    r(i)=v(i-1)+v(i);
    
end
v=r


%% (3)Random Integers

n = 100000;

v = randi([4,100],1,n);
v2 = v(v>30); %Erase numbers <= 30
v3 = rem(v2,3*ones(1,length(v2))); %Obtain 0 if the number is multiple of 3
v4 = v3(v3==0); %Erase numbers ~=0 (which means they were not multiple of 3)

res = length(v4)
percentage = 100*res/n %The expected value is 23







