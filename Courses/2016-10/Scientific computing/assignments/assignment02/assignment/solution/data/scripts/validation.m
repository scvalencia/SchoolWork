% Validate the execution and computationf of the nroots function, whose
% purpose is to find the roots of an arbitrary degree polynomial. This,
% is a comparisson between nroots (bairstow), and native function roots

degrees = [3 5 6 8 13 15 17 20];    % degrees to perfomr evaluation
iter = 8;                           % size of degrees

epsilon = 0.00001;                  % tolerance for Bairtsow's method

matlaberrors = zeros(1, iter);      % errors by root function
bairstowerrors = zeros(1, iter);    % errors by Bairtsow's methos

i = 1;
while i <= iter                     % for each degree, perform the comparisson
    current = degrees(i);           % current degree
    
    % a random polynomial of current degree
    polynomial = rand(1, current + 1);  
    
    % root by Matlab'w own function and Bairstow's method
    matlabroots = roots(polynomial);
    bairstowroots = nroots(polynomial, epsilon);
    
    % acum error for each of the roots
    matlaberror = 0; bairstowerror = 0;
    
    % evaluate each root at the polynomial, and measure how far this
    % value is from zero. Register each for each method
    for j = 1:current
        matlabroot = matlabroots(j);
        bairstowroot = bairstowroots(j);
        
        matlabval = polyval(polynomial, matlabroot);
        bairstowval = polyval(polynomial, bairstowroot);
        
        matlaberror = matlaberror + matlabval;
        bairstowerror = bairstowerror + bairstowval;         
    end;
    
    % populate error vectors
    matlaberrors(i) = abs(matlaberror);
    bairstowerrors(i) = abs(bairstowerror);
    i = i + 1;
end;