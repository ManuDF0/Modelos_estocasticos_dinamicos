global alpha delta gamma beta;

beta = 0.99;
gamma = 0.6;
delta = 0.25;
alpha = 0.36;

A = [0, 0, c;
     0, 0, 0;
     0, 0, 0;
     0, 0, 0;
     0, 0, 0;
    -k, -m, m - r_n*n;
     0, 0, 0;
     0, 0, 0;
     0, 0, 0;
     0, 0, gamma;
     0, 0, -l;
     0, 0, -w*h_f];

B = [0, -m, 0;
    -r*k, 0, 0;
     0, 0, 0;
     0, 0, 0;
    (1 - delta)*k, 0, 0;
     1, 0, 0;
     0, 0, 0;
    -alpha, 0, 0;
     0, 0, 0;
     0, 0, 0;
     0, 0, 0;
     0, 0, 0];

C = [c, 0, 0, 0, 0, n, 0, 0, 0, 0, 0, 0;
    0, -w*h, -r*k, y, 0, 0, 0, 0, 0, 0, 0, -w*h;
    0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0;
    0, 0, 0, 0, 0, 0, 0, 0, -h_p, -h_f, 0, h;
    0, 0, 0, y, 0, r_n*n, r_n*n, 0, 0, 0, 0, 0;
    0, 0, 1, -1, 0, 0, 0, 0, 0, 0, 0, 0;
    -1, 1, 0, 0, 0, 0, -1, 0, 0, 0, 0, -(w*h)/(c*r_n);
    0, 1, 0, 0, 0, 0, 0, 1, alpha, 0, 0, 0;
    0, 0, 0, 0, l, -n, 0, 0, 0, 0, 0, 0;
    0, 0, 0, 0, -gamma, 0, 0, 0, 0, 1, 0, 0;
    0, -1, 0, 0, l, 0, 0, 0, -1, 0, 0, 0;
    0, -w*h_f, 0, 0, r_f*l, -r_n*n, -r_n*n, r_f*l, 0, -w*h_f, 0, 0];

D = [0, 0;
     0, 0;
     0, 0;
     0, 0;
     0, 0;
     0, 0;
     0, 0;
     0, -1;
    -m, 0;
     0, 0;
     0, 0;
     0, 0];

F = [0, 1, 0;
     0, 0, 0;
     0, 0, -1];

G = [0, -1, 0;
     0, 0, 0;
     0, 0, 1];

H = [0, 0, 0;
     0, 0, 0;
     0, 0, 0];

J = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
    -1, 0, beta*r, 0, 0, 0, -1, 0, 0, 0, 0, 0;
    -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

K = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
     1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0;
     1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0];

L = [0, 0;
     0, 0;
     0, 0];

M = [-1, 0;
     0, 0;
     0, 0];
    
mkdir('../Matlab/input');

csvWrite(A, "../Matlab/input/A.csv");
csvWrite(B, "../Matlab/input/B.csv");
csvWrite(C, "../Matlab/input/C.csv");
csvWrite(D, "../Matlab/input/D.csv");
csvWrite(F, "../Matlab/input/F.csv");
csvWrite(G, "../Matlab/input/G.csv");
csvWrite(H, "../Matlab/input/H.csv");
csvWrite(J, "../Matlab/input/J.csv");
csvWrite(K, "../Matlab/input/K.csv");
csvWrite(L, "../Matlab/input/L.csv");
csvWrite(M, "../Matlab/input/M.csv");
