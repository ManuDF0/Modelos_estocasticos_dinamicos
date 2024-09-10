A = [0, 0, c;
     k, m, -m + r_n*n;
     0, 0, 0;
     0, 0, 0;
     0, 0, 0;
     0, 0, 0;
     0, 0, -theta*n;
     0, 0, -(theta*(r_f-1)+1-r_n);
     0, 0, 1 - theta];

B = [0, -m, 0;
    -k/beta, 0, 0;
    (1-alpha), 0, 0;
     0, 0, 0;
    -alpha, 0, 0;
     -alpha, 0, 0;
     0, 0, 0;
     0, 0, 0;
     0, 0, 0];

C = [c, 0, 0, 0, 0, 0, n, 0, 0;
    0, -w*h, -w*h, -r*k, 0, 0, -r_n*n, -r_n*n, 0;
    0, 0, -(1-alpha), 1, 0, 0, 0, 0, 0;
    -1, 1, -(w*h)/(c*r_n), 0, 0, 0, 0, -1, 0;
    0, 1, alpha, 0, 0, 0, 0, 0, 1;
    0, 0, -(1-alpha), 0, 1, 0, 0, 0, 0;
    0, -w*h, -w*h, 0, 0, 0, theta*n, 0, 0;
    0, 0, 0, 0, 0, 0, (theta*(r_f-1) + 1 - r_n), -r_n, theta*r_f;
    0, 0, 0, 0, 0, -1, theta, 0, 0];

D = [0, 0;
     0, 0;
     0, -1;
     0, 0;
     0, -1;
     0, -1;
     m, 0;
     (m/l)*r_f, 0;
     m/n, 0];

F = [0, 1, 0;
     0, 0, 0;
     0, 0, -1];

G = [0, -1, 0;
     0, 0, 0;
     0, 0, 1];

H = [0, 0, 0;
     0, 0, 0;
     0, 0, 0];

J = [0, 0, 0, 0, 0, 0, 0, 0, 0;
    -1, 0, 0, beta*r, 0, 0, 0, -1, 0;
    -1, 0, 0, 0, 0, 0, 0, 0, 0];

K = [0, 0, 0, 0, 0, 0, 0, 0, 0;
     1, 0, 0, 0, 0, 0, 0, 1, 0;
     1, 0, 0, 0, 0, 0, 0, 1, 0];

L = [-1, 0;
     0, 0;
     0, 0];

M = [0, 0;
     0, 0;
     0, 0];
    
mkdir('../MATLAB/input');

csvWrite(A, "../MATLAB/input/A.csv");
csvWrite(B, "../MATLAB/input/B.csv");
csvWrite(C, "../MATLAB/input/C.csv");
csvWrite(D, "../MATLAB/input/D.csv");
csvWrite(F, "../MATLAB/input/F.csv");
csvWrite(G, "../MATLAB/input/G.csv");
csvWrite(H, "../MATLAB/input/H.csv");
csvWrite(J, "../MATLAB/input/J.csv");
csvWrite(K, "../MATLAB/input/K.csv");
csvWrite(L, "../MATLAB/input/L.csv");
csvWrite(M, "../MATLAB/input/M.csv");
