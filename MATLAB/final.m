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
impulse_response(P,Q,R,S,N, 50, 1, [1; 4; 5; 6; 7; 8; 11; 12]);
title('Real Variables')
legend('k', 'c', 'w', 'h', 'r', 'y', 'rn', 'rf')

subplot(2,1,2)
impulse_response(P,Q,R,S,N, 50, 1, [2; 3; 9; 10]);
title('Nominal Variables')
legend('M', 'P', 'L', 'N')

saveas(gcf, 'shock_dinero.png');

figure(2)
subplot(2,1,1)
impulse_response(P,Q,R,S,N, 50, 2, [1; 4; 5; 6; 7; 8; 11; 12]);
title('Real Variables')
legend('k', 'c', 'w', 'h', 'r', 'y', 'rn', 'rf')

subplot(2,1,2)
impulse_response(P,Q,R,S,N, 50, 2, [2; 3; 9; 10]);
title('Nominal Variables')
legend('M', 'P', 'L', 'N')

saveas(gcf, 'shock_tecnología.png');
