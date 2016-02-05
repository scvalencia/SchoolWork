sum = 0;
for k=1:3000
    k = chop(k * k, 4);
    sum = sum + (1 / k);
end
chop(chop(sum, 4), 5)