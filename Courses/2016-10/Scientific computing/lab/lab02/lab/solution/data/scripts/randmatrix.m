function [matrix, b] = randmatrix(size, kind)

    MIN = 1;
    MAX = 10;
    
    b = randi([MIN MAX], size, 1);

    switch(kind)
        case 'UT'
            UT = triu(randi([MIN MAX], size),1);            
            for i=1:size
                UT(i, i) = randi([MIN, MAX]);
            end;
            matrix = UT;
        case 'LT'
            LT = tril(randi([MIN MAX], size),-1);
            for i=1:size
                LT(i, i) = randi([MIN, MAX]);
            end;
            matrix = LT;
        case 'SYM'
            seed = randi([MIN MAX], size);
            SYM = triu(seed) + triu(seed, 1)';
            matrix = SYM;
        case 'RECT'
            RECT = zeros(size);
            for i = 1:size-1
                RECT = RECT + randi([MIN MAX], size, 1) * randi([MIN MAX], 1, size); 
            end
            B = randi([MIN MAX], size, ceil(size / 2));
            RECT = [RECT B];
            matrix = RECT;
        case 'POSDEF'
            POSDEF= randi([MIN MAX], size);
            for i=1:size
                POSDEF(i, i) = 0;
                POSDEF(i, i) = sum(abs(POSDEF(i,:))) * 4;
            end;
            matrix = POSDEF;
        case 'UHESS'
            seed = randi([MIN MAX], size, size);
            UHESS = ceil(hess(seed));
            matrix = UHESS;
        case 'TRANSA'
            seed = complex(randi([MIN MAX], size, size), randi([MIN MAX], size, size));
            TRANSA = conj(seed)';
            matrix = TRANSA;              
    end;   
end