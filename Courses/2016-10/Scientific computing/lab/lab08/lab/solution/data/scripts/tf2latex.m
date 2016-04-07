function tf2latex(tf)

    [num,den]=tfdata(tf);
    syms s
    d1 = digits(4); % records and sets accuracy
    latex(vpa(poly2sym(cell2mat(num),s)/poly2sym(cell2mat(den),s)))
    digits(d1); 

end