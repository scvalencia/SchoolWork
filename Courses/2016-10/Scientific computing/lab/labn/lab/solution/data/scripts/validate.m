function [A, b, x] = validate(n)
    [A, b] = generate_system(n);    
    [UT, vector] = gaussian_elimination(A, b);
    x = back_substitution(UT, vector);    
    A = single(A);
    b = single(b);
    x = single(x);

end