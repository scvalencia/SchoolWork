function [measurements, err] = symmeasurement(dimension)

    MATRICES = {'UT', 'LT', 'SYM', 'RECT', 'POSDEF', 'UHESS', 'TRANSA'};
    n = size(MATRICES);
    n = n(2);

    measurements = zeros(n);
    err = zeros(n);

    for j=1:n
        opts.(MATRICES{j}) = false;
    end;

    macrocounter = 1;
    for k=1:n
        kind = MATRICES{k};
        [matrix, b] = randmatrix(dimension, kind);
        
        ms = zeros(1, 7);
        es = zeros(1, 7);

        counter = 1;
        for i=1:n
            current = MATRICES{i};
            for j=1:n
                if(strcmp(MATRICES{j}, current) == 0)
                    opts.(MATRICES{j}) = false;
                else
                    opts.(MATRICES{j}) = true;
                end;        
            end;
            
            if(strcmp('POSDEF', kind) == 1)
                opts.('SYM') = true;
            end;
            
            try
                start = tic;
                x = symmlq(matrix, b);
                elapsed = toc(start);
                
                if(strcmp('TRANSA', kind) == 1)
                    residual = b - matrix'*x;
                else
                    residual = b - matrix*x;
                end;
                
                es(counter) = norm(residual) / norm(b);
                ms(counter) = elapsed;
            catch
                es(counter) = -1;
                ms(counter) = -1;
            end;           
            
            counter = counter + 1;
        end;

        measurements(macrocounter, :) = ms;
        err(macrocounter, :) = es;
        
        macrocounter = macrocounter + 1;

    end;    
end