sum = 0;

for k=1:3000
    sum = chop(sum+1/k^2, 4); 
end

sum