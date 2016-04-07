function [a0, a, b] = fourier(f, lowbound, uppbound, harmonics)

	tm = (uppbound - lowbound) / 2;
	a0 = (1 / (2 * tm)) * quad(f, lowbound, uppbound);

	a = zeros(harmonics, 1); b = zeros(harmonics, 1); 

	for i=1:harmonics
		
		f2 = @(t) f(t)' * cos(i * t * pi / tm);
		f3 = @(t) cos(i * t * pi / tm) .^ 2;
		f4 = @(t) f(t)' * sin(i * t * pi / tm);
		f5 = @(t) sin(i * t * pi / tm) .^ 2;

		a(i) = quad(f2, lowbound, uppbound) / quad(f3, lowbound, uppbound);
		b(i) = quad(f4, lowbound, uppbound) / quad(f5, lowbound, uppbound);
	end;
end
