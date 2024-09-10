A = [0, 0, 0;
     0, 0, c;
     k, m, r_n*n - m;
     0, 0, 0;
     0, 0, 0;
     0, 0, 0;
     0, 0, (r_n - r_f)*n;
     0, 0, -n];

B = [0, 0, 0;
    0, -m, 0;
    -(r+1-delta)*k, 0, 0;
     -alpha, 0, 0;
    1-alpha, 0, 0;
     -alpha, 0, 0;
     0, 0, 0;
     0, 0, 0];

C = [1, -1, 0, 0, 0, 0, 0, 0;
    c, 0, 0, 0, 0, n, 0, 0;
    0, -w*h, -w*h, -r*k, 0, -r_n*n, -r_n*n, 0;
    0, 1, alpha, 0, 0, 0, 0, 1;
    0, 0, (alpha - 1), 1, 0, 0, 0, 0;
    0, 0, (alpha - 1), 0, 1, 0, 0, 0;
    0, 0, 0, 0, 0, (r_f-r_n)*n, -r_n*n, r_f*n;
    0, -w*h, -w*h, 0, 0, n, 0, 0];

D = [0, 0;
     0, 0;
     0, -1;
     0, -1;
     0, -1;
     0, 0;
     r_f*m, 0;
     m, 0];

F = [0, 0, -1;
     0, 0, 0;
     0, 0, 0];

G = [0, 0, 1;
     0, 0, 0;
     0, 1, 0];

H = [0, 0, 0;
     0, 0, 0;
     0, -1, 0];

J = [-1, 0, 0, 0, 0, 0, 0, 0;
    0, -1, 0, beta*r, 0, 0, 0, 0;
    0, 0, 0, 0, 0, 0, 0, 0];

K = [0, 1, 0, 0, 0, 0, 0, 0;
     0, 1, 0, 0, 0, 0, 0, 0;
     0, 0, 0, 0, 0, 0, 0, 0];

L = [0, 0;
     0, 0;
     0, 0];

M = [0, 0;
     0, 0;
     -1, 0];
    
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
