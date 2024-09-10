function impulse_response(P, Q, R, S, N, runlgth, shock, vecvar)
% Determina la cantidad de variables estocasticas con numshocks
[aq,numshocks]=size(Q);
% Determina la cantidad de varibales jump y de estado
[numjump,numstate]=size(R);

% Arma un epsilon
e=zeros(numshocks,runlgth);
% la variable shock dice a qué variable estocastica shockear, 1 sería a la
% tecnología. El shock es que pase de 0 a 1
e(shock,2)=1;

% Arma un vector columna con las variables de estado
xold=zeros(numstate,1);

% Arma un vector con las variables estocasticas
shockold=zeros(numshocks,1);
for i=1:runlgth
    % Este es el proceso AR
    shocknew=N*shockold+e(:,i);
    
    % Usa las leyes de movimiento para ir actualizando las variables de
    % estado y las de control
    x(:,i)=P*xold+Q*shocknew;
    y(:,i)=R*xold+S*shocknew;
    
    % Actualiza el vector de variables de estado y el de variables
    % estocásticas
    xold=x(:,i);
    shockold=shocknew;
end

% Arma una matriz con las variables de estado y las de control
z= [x
    y];
% Vecvar selecciona la cantidad de filas de esta matriz que quiere graficar
z=z(vecvar,:);
plot(z')
end
