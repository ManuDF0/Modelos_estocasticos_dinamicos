A = csvread('..\input\A.csv');
B = csvread('..\input\B.csv');
C = csvread('..\input\C.csv');
D = csvread('..\input\D.csv');
F = csvread('..\input\F.csv');
G = csvread('..\input\G.csv');
H = csvread('..\input\H.csv');
J = csvread('..\input\J.csv');
K = csvread('..\input\K.csv');
L = csvread('..\input\L.csv');
M = csvread('..\input\M.csv');

N = [.02, 0;
    0, .95];


[P,Q,R,S]=llinsolve_modif(A,B,C,D,F,G,H,J,K,L,M,N,1)

figure(1)
z=impres(P,Q,R,S,N,[1; 4; 5; 6; 7; 8; 11; 12],1,30);
title('Real Variables money growth shock')
legend('k', 'c', 'w', 'h', 'r', 'y', 'rn', 'rf')

figure(2)
z=impres(P,Q,R,S,N,[1; 4; 5; 6; 7; 8; 11; 12],2,55);
title('Real Variables technology shock')
legend('k', 'c', 'w', 'h', 'r', 'y', 'rn', 'rf')

figure(3)
z=impres(P,Q,R,S,N,[2; 3; 9; 10],2,25);
title('Nominal Variables')
legend('M', 'P', 'L', 'N')