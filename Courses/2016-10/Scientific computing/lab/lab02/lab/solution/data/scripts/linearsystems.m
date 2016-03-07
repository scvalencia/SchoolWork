% Three equations, one solution
A = [ 1 2 2 ; 1 3 3 ; 2 6 5 ];
b = [ 4 ; 5 ; 6 ];
x1 = linsolve(A, b);

latex_table1 = latex(sym(A));
latex_vector1 = latex(sym(b));

% Three equations, infnitely many solutions
A = [ 1 2 0 1 ; 1 1 1 -1 ; 3 1 5 -7];
b = [ 7 ; 3 ; 1 ];
x2 = linsolve(A, b);
[ans1, R1] = linsolve(A, b);

latex_table2 = latex(sym(A));
latex_vector2 = latex(sym(b));

% Three equations, no solution
A = [ 1 1 1 ; 3 2 1 ; 1 -2 -5 ];
b = [ 3 ; 3 ; 1 ];
x3 = linsolve(A, b);
[ans2, R2] = linsolve(A, b);