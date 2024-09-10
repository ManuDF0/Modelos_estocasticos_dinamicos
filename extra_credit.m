A = csvread('input\A.csv');
B = csvread('input\B.csv');
C = csvread('input\C.csv');
D = csvread('input\D.csv');
F = csvread('input\F.csv');
G = csvread('input\G.csv');
H = csvread('input\H.csv');
J = csvread('input\J.csv');
K = csvread('input\K.csv');
L = csvread('input\L.csv');
M = csvread('input\M.csv');

N = [.02, 0;
    0, .95];

[P, Q, R, S] = calculate_stable(A, B, C, D, F, G, H, J, K, L, M, N);

figure(1)
subplot(2,1,1)
impulse_response(P,Q,R,S,N, 20, 1, [1; 4; 7; 5; 15; 6; 10; 11]);
title('Real Variables')
legend('k', 'c', 'y', 'w', 'h', 'r', 'rn', 'rf')

subplot(2,1,2)
impulse_response(P,Q,R,S,N, 20, 1, [2; 3; 8; 9]);
title('Nominal Variables')
legend('M', 'P', 'L', 'N')

figure(2)
subplot(2,1,1)
impulse_response(P,Q,R,S,N, 50, 2, [1; 4; 7; 5; 15; 6; 10; 11]);
title('Real Variables')
legend('k', 'c', 'y', 'w', 'h', 'r', 'rn', 'rf')

subplot(2,1,2)
impulse_response(P,Q,R,S,N, 50, 2, [2; 3; 8; 9]);
title('Nominal Variables')
legend('M', 'P', 'L', 'N')


