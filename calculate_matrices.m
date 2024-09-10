function [V, E] = calculate_matrices(J, C, B, G, K, A, H, F)
    % Calcular las matrices V y E a partir de las matrices de entrada
    C_inv = inv(C);
    
    V = [J*C_inv*B - G + K*C_inv * A, K*C_inv*B + H;
         eye(size(J, 1), size(G, 2)), zeros(size(J, 1), size(H, 2))];

    E = [F - J*C_inv * A, zeros(size(F, 1), size(A, 2));
         zeros(size(F, 1), size(A, 2)), eye(size(F, 1), size(A, 2))];
end