program nim(input, output);
	label
		A, ASKA, B, ASKB, WINNER;
	type
		player = (Alice, Bob);
	var
		p, q, r : integer;
		a1, a2, a3, b1, b2, b3 : integer;
		w : player;

	procedure gets(var p1, p2, p3 : integer);
	begin
		read(p1);
		read(p2);
		read(p3);

		p := p - p1;
		q := q - p2;
		r := r - p3;
	end;

	procedure puts(w : player);
	begin
		writeln('Winner: ', w) 
	end;

begin
	read(p, q, r);
	A:
		gets(a1, a2, a3);
		goto ASKA;
	ASKA:
		if (p + q + r = 0) then begin
			w := Alice;
			goto WINNER
		end
		else goto B;
	B:
		gets(b1, b2, b3);
		goto ASKB;
	ASKB:
		if p + q + r = 0 then begin
			w := Bob;
			goto WINNER
		end
		else
			goto A;
	WINNER:
		puts(w)
end.