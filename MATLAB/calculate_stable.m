function [P, Q, R, S] = calculate_stable(A, B, C, D, F, G, H, J, K, L, M, N)
C_inv = inv(C);

% Calculamos las matrices V y E
[V, E] = calculate_matrices(J, C, B, G, K, A, H, F);

% Calculamos los autovalores y autovectores generalizados
[U, T] = eig(V, E);

% Tomamos los eigenvalues
eigenvalues = diag(T);

% Los ordenamos de acuerdo a su valor absoluto
[sorted_eigenvalues, idx] = sort(abs(eigenvalues));

% Ordenamos las matrices de acuerdo al orden de los eigenvalues
T = T(idx, idx);
U = U(:, idx);
disp('Matriz de autovalores:');
disp(T);
disp('Matriz de autovectores:');
disp(U);

% En realidad esto es 2n
n = size(U, 1);

% Agarro la matriz de autovectores y me quedo solo con la parte que
% necesito
X_12 = U(n/2+1:end, 1:n/2);
disp('Matriz X_12:');
disp(X_12);
X_12_inv = inv(X_12);
% Solo necesito los autovectores cuyo valor absoluto es menor a 1
% Dada la formula para P, necesito X_12

% Me quedo con delta_1, los autovalores asociados a autovectores con
% abs()<1
delta_1 = T(1:n/2, 1:n/2);

% Calculo P
P = X_12*delta_1*X_12_inv;
disp('Matriz P:');
disp(P);

% Una vez que calcule P, puedo calcular R
R = -C_inv*(A*P + B);
disp('Matriz R:');
disp(R);

% Calculo algunas matrices auxiliares para poder calcular Q
W = F*P + G + J*R  - K*C_inv*A;
Y = F - J*C_inv*A;
Z = (J*C_inv*D-L)*N + K*C_inv*D-M;
vec_Z = Z(:);
I_k = eye(size(N'));

% Calculo la matriz Q
vec_Q = inv(kron(I_k, W) + kron(N', Y))*vec_Z;
[aa, bb] = size(Z);
Q = reshape(vec_Q, aa, bb);
disp('Matriz Q:');
disp(Q);

% Por último, con la matriz Q puedo conseguir S
S = -C_inv*(A*Q + D);
disp('Matriz S:');
disp(S);
end