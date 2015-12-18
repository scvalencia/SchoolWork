err = [1, 1e-1, 1e-2, 1e-3, 1e-4, 1e-5];

for i = err
   [r1, r21, r22, r3] = integracion(i, 0);
    fprintf('%.6f\n', r1);
    fprintf('%.6f\n', r21);
    fprintf('%.6f\n', r22);
    fprintf('%.6f\n', r3);
    fprintf('%s\n', '');
end
