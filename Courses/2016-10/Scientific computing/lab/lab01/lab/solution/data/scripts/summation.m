sum = 0;
for k=1:3000
    k = k * k;
    sum = sum + (1 / k);
end

chop(sum, 5)