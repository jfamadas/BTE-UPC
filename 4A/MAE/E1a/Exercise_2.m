%% (1)

A = [1 2 3 ; 4 5 6];
[r,c]=size(A);
v = zeros(1,c);
B = [A;v];
C = flip(B);
R = C(2:r+1,:)

%% (2)

A = ones(1,3);
B = eye(3);
C = zeros(3,2);

%(3)

M1 = [2*B(1:2,1:2) C'];
M2 = [-3*A' A' 5*B];
M = [M1 ; M2]

%% (4)

v = [ 1 2 3 4]

[X,Y] = meshgrid(v,v);
M = Y-X

%% (5)

m=5;
an = [1 2 3];
n = length(an);

A = (repmat(an',1,m)).^(repmat(0:m-1,n,1))

%% (6)

an = [1 2 3 4];
n = length(an);
m = n;

A = (repmat(an',1,m)).^(repmat(0:m-1,n,1))

determ = det(A);
eigen = eig(A);

product = an(1);
for j = 2:n
    i = 1:j-1;
    product = product * prod(an(j)-an(i));
end    

comprovation1 = determ/product %This value is 1 if the verification is true
comprovation2 = determ/prod(eigen) %This value is 1 if the verification is true


%% (7)

A = [2 1 -2 ; 4 2 -3 ; -2 0 1];
b = [4 ; 9 ; -3];

X = inv(A)*b;
x1 = X(1)
x2 = X(2)
x3 = X(3)

Y = A\b;
y1 = Y(1)
y2 = Y(2)
y3 = Y(3)


