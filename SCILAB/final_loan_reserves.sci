function f = system_of_equations(x)
    // Parámetros (deberán ser definidos o pasados como variables globales)
    global alpha delta gamma beta theta;
    
    // Especifico a que variable corresponde cada valor de mi vector inicial
    r = x(1);
    r_f = x(2);
    r_n = x(3);
    w = x(4);
    l = x(5);
    h = x(6);
    y = x(7);
    k = x(8);
    c = x(9);
    m = x(10);
    n = x(11);
    
    f = zeros(1, 11);
    
    // Sistema de ecuaciones
    f(1) = 1 - beta * r_n;
    f(2) = 1 - beta * (r + (1 - delta));
    f(3) = r - alpha* (h/k)^(alpha-1);
    f(4) = r_f*w - (1 - alpha) * (y / h);
    f(5) = 1 - (w / (c * r_n)) * (1 - h);
    f(6) = y - k^alpha * (h)^(1 - alpha);
    f(7) = l - n;
    f(8) = c - m + n;
    f(9) = w*h + r*k - delta * k + r_n * n - m;
    f(10) = theta*r_f*l + (1-theta)*l - r_n*n;
    f(11) = w*h - theta*l;
endfunction

// Definición de parámetros globales
global alpha delta beta theta;
// Seteo un valor
alpha = 0.36;  
delta = 0.025;   
beta = 0.99;
theta = 0.75;   

// Valor inicial para el solver
x0 = [0.035101, 0.1, 1.010101, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1];

// Resolución del sistema de ecuaciones
options = struct("maxiter", 100000); // Cambio la configuracion para que haga mas iteraciones
[xres, v, info] = fsolve(x0, system_of_equations);
//xres es el vector con las soluciones, v es el valor de las funciones evaluadas en xres, entonces deberían estar todas cerca de 0 y por ultimo, info contiene informacion sobre la solucion

// Mostrar resultados
r = xres(1);
r_f = xres(2);
r_n = xres(3);
w = xres(4);
l = xres(5);
h = xres(6);
y = xres(7);
k = xres(8);
c = xres(9);
m = xres(10);
n = xres(11);
    answ = [
        "r", string(r);
        "r_f ", string(r_f);
        "r_n ", string(r_n);
        "w", string(w);
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
disp("Información del solver:");
disp(info);
disp("Residuos");
disp(v);
