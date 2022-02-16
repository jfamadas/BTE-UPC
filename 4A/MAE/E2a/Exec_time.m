%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MAE Exercise 1, problem set 3
% ETSETB-UPC
%%%%%%%%55555555555555555555555555555555555555555555555555555555
clear
tic
N=2000;
B=randn(N);
C=randn(N);
for kr=1:N,
    for kc=1:N,
        A(kr,kc)=B(kr,:)*C(:,kc);
    end
end
toc

clear
tic
N=2000;
B=randn(N);
C=randn(N);
A=zeros(N);
for kr=1:N,
    for kc=1:N,
        A(kr,kc)=B(kr,:)*C(:,kc);
    end
end
toc

clear
tic
N=2000;
B=randn(N);
C=randn(N);
A=zeros(N);
for kc=1:N,
    A(:,kc)=B*C(:,kc);
end
toc

clear
tic
N=2000;
B=randn(N);
C=randn(N);
A=B*C;
toc

