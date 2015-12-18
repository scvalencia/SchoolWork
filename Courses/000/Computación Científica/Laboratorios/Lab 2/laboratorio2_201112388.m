clear all; close all; clc;
msg = 'Utilice el comando dbcont para continuar\nrevisando los siguientes puntos\n';
%% Punto 1
    % Definición de variables
    A = [1 1 0; 0 1 1; 0 0 1];
    B = [1i 1-1i 2+1i; 0 -1 3-1i; 0 0 -1i];
    C = [1 1 1; 0 sqrt(2)*1i -sqrt(2)*1i;1 -1 -1];

    % Operaciones básicas
    R1 = A*B - B*A;
    R2 = A.^2 + B^.2 + C.^2;
    R3 = A*B*C;
    R4 = sqrtm(A) + sqrtm(B) + sqrtm(C);
    R5 = exp(A)*(exp(B) + exp(C));

    % Rango de matrices
    R6 = rank(A);
    R7 = rank(B);
    R8 = rank(C);

    % Inversas
    R9 = inv(A);
    R10 = inv(B);
    R11 = inv(C);

    % Trazas
    R12 = trace(A);
    R13 = trace(B);
    R14 = trace(C);

    % Determinantes
    R15 = det(A);
    R16 = det(B);
    R17 = det(C);
    
    % Vectores y valores propios - [vectores, valores] = eig(A)
    [R21, R18] = eig(A); 
    R18 = diag(R18);
    [R22, R19] = eig(B);
    R19 = diag(R19);
    [R23, R20] = eig(C);
    R20 = diag(R20);
    
    % Para ayudar a la revisión de los ejercicios
    fprintf(msg);
    keyboard;
    clearvars -except msg; close all; clc;
    
%% Punto 2
    % Definición de la matriz
    A = zeros(5,5);
    for i = 1 : size(A,1)
        for j = 1 : size(A,2)
            A(i, j) = i^3 - j^2;
        end
    end
    
    % Sub-matriz
    Asub = A(2:4, 3:4);
    
    % Eliminación de filas y columnas
    Amod = A;
    Amod(1,:) = []; % Se elimina la fila 1 de A
    Amod(3,:) = []; % Se elimina la fila 4 de A
    Amod(:,5) = []; % Se elimina la columna 5 de A
    
    % Intercambio de filas y columnas
    % Primera y última fila
    aux = Amod(1,:);
    Amod(1,:) = Amod(end,:);
    Amod(end,:) = aux;
    % Primera y última columna
    aux = Amod(:,1);
    Amod(:,1) = Amod(:,end);
    Amod(:,end) = aux;
    
    % Columna de unos a la derecha de Amod
    Amod(:,end+1) = ones(size(Amod,1),1);
    % Columna de unos a la izquierda de Amod
    Amod = [ones(size(Amod,1),1) Amod];
    % Dos filas de unos arriba de Amod
    Amod = [ones(2,size(Amod,2)) ; Amod];
    % Dos filas de unos abajo de Amod
    Amod = [Amod ; ones(2,size(Amod,2))];
    
    % Para ayudar a la revisión de los ejercicios
    fprintf(msg);
    keyboard;
    clearvars -except msg; close all; clc;

%% Punto 3
    % Descomposición de matrices
    A = [1 5 -2; -7 3 1; 2 2 -2];
    b = ones(3,1);
    
    [L, U] = lu(A);
    y = L\b;
    X1 = U\y;
    
    % Para ayudar a la revisión de los ejercicios
    fprintf(msg);
    keyboard;
    clearvars -except msg; close all; clc;
    
%% Punto 4
    % Diagonalización de matrices
    A = [3 -1 0; -1 2 -1; 0 -1 3];
    [P,~] = eig(A);
    J = inv(P)*A*P; % Matriz diagonal
    
    % Para ayudar a la revisión de los ejercicios
    fprintf(msg);
    keyboard;
    clearvars -except msg; close all; clc;
    
%% Punto 5
    % Planteamiento de ecuaciones
    syms Vin R1 R2 R3 R4;
    A = [-(1/R1+1/R2+1/R3) 1/R2;...
         1/R2             -(1/R2+1/R4)];
    b = [-Vin/R1 ; 0];
    x = linsolve(A,b);
    % Solución del sistema de ecuaciones
    Vb = x(1);
    Vc = x(2);
    
    % Para ayudar a la revisión de los ejercicios
    fprintf(msg);
    keyboard;
    clearvars -except msg; close all; clc;
    
%% Punto 6
    syms x1 x2 u g l;
    f = [x2; g*sin(x1)/l + u*cos(x1)];
    
    % Matriz A
    DA = [diff(f(1), x1) diff(f(1), x2);
          diff(f(2), x1) diff(f(2), x2)];
    JA = jacobian(f, [x1 x2]);
    % Se evaluan DA y JA en x = [0 0]' u = 0
    DA = subs(DA, [x1 x2 u], [0 0 0]);
    JA = subs(JA, [x1 x2 u], [0 0 0]);
    
    % Vector B
    DB = [diff(f(1), u); diff(f(2), u)];
    JB = jacobian(f, u);
    % Se evaluan DB y JB en x = [0 0]' u = 0
    DB = subs(DB, [x1 x2 u], [0 0 0]);
    JB = subs(JB, [x1 x2 u], [0 0 0]);