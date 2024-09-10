function f = system_of_equations(x)
    // Parámetros (deberán ser definidos o pasados como variables globales)
    global alpha delta gamma beta;
    
    // Especifico a que variable corresponde cada valor de mi vector inicial
    r = x(1);
    r_f = x(2);
    r_n = x(3);
    w_p = x(4);
    w = x(5);
    h_p = x(6);
    h_f = x(7);
    l = x(8);
    h = x(9);
    y = x(10);
    k = x(11);
    c = x(12);
    m = x(13);
    n = x(14);
    
    f = zeros(1, 14);
    
    // Sistema de ecuaciones
    f(1) = 1 - beta * r_n;
    f(2) = 1 - beta * (r + (1 - delta));
    f(3) = r - alpha * (y / k);
    f(4) = r_f * w_p - w;
    f(5) = alpha * (h_p / k)^(1 - alpha) - r;
    f(6) = l - n;
    f(7) = l^gamma - h_f;
    f(8) = r_f - r_n - w * l^(gamma - 1);
    f(9) = h - h_f - h_p;
    f(10) = y - k^alpha * (h_p)^(1 - alpha);
    f(11) = 1 - (w / (c * r_n)) * (1 - h);
    f(12) = c - m + n;
    f(13) = y - delta * k + r_n * n - m;
    f(14) = w - (1 - alpha) * (k / h_p)^alpha;
endfunction


function display_results(xres)
    global alpha delta gamma beta;
    r = xres(1);
    r_f = xres(2);
    r_n = xres(3);
    w_p = xres(4);
    w = xres(5);
    h_p = xres(6);
    h_f = xres(7);
    l = xres(8);
    h = xres(9);
    y = xres(10);
    k = xres(11);
    c = xres(12);
    m = xres(13);
    n = xres(14);
    
    answ = [
        "r", string(r);
        "r_f ", string(r_f);
        "r_n ", string(r_n);
        "w_p ", string(w_p);
        "w", string(w);
        "h_p ", string(h_p);
        "h_f ", string(h_f);
        "l", string(l);
        "h", string(h);
        "y", string(y);
        "k", string(k);
        "c", string(c);
        "m", string(m);
        "n", string(n);
    ];
    
    disp("Resultados del sistema de ecuaciones:");
    disp(answ);
endfunction

// Definición de parámetros globales
global alpha delta gamma beta;
// Seteo un valor
alpha = 0.36;  
delta = 0.25; 
gamma = 0.6;   
beta = 0.99;   

// Valor inicial para el solver
x0 = [0.260101, 0.1, 1.010101, 0.1, 0.7683918, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1];

// Resolución del sistema de ecuaciones
options = struct("maxiter", 100000); // Cambio la configuracion para que haga mas iteraciones
[xres, v, info] = fsolve(x0, system_of_equations);
//xres es el vector con las soluciones, v es el valor de las funciones evaluadas en xres, entonces deberían estar todas cerca de 0 y por ultimo, info contiene informacion sobre la solucion

// Mostrar resultados
display_results(xres);
disp("Información del solver:");
disp(info);

r = xres(1);
r_f = xres(2);
r_n = xres(3);
w_p = xres(4);
w = xres(5);
h_p = xres(6);
h_f = xres(7);
l = xres(8);
h = xres(9);
y = xres(10);
k = xres(11);
c = xres(12);
m = xres(13);
n = xres(14);
