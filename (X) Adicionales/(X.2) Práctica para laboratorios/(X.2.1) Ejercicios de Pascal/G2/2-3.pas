{* Escribir un algoritmo donde se ingresan 3 números distintos y se deben
ordenar de menor a mayor, e imprimir por pantalla. *}

program EJ3;

var
	a, b, c: integer;
	menor, intermedio, mayor: integer;

begin
	write('Introduzca un número A: ');
	readln(a);

	write('Introduzca un número B: ');
	readln(b);

	write('Introduzca un número C: ');
	readln(c);

	if (a > b) and (a > c) then
	begin
		mayor := a;

		if b < c then
			begin
				intermedio := c;
				menor := b;
			end
		else
			if b = c then
				begin
					intermedio := b;
					menor := intermedio;
				end
			else
				begin
					intermedio := b;
					menor := c;
				end;
	end;

	if (b > a) and (b > c) then
	begin
		mayor := b;

		if a < c then
			begin
				intermedio := c;
				menor := a;
			end
		else
			if a = c then
				begin
					intermedio := a;
					menor := intermedio;
				end
			else
				begin
					intermedio := a;
					menor := c;
				end;
	end;

	if (c > a) and (c > b) then
	begin
		mayor := c;

		if a < b then
			begin
				intermedio := b;
				menor := a;
			end
		else
			if a = b then
				begin
					intermedio := a;
					menor := intermedio;
				end
			else
				begin
					intermedio := a;
					menor := b;
				end;
	end;

	writeln();
	if (a = b) and (b = c) then
		writeln('¡Los tres números coinciden!')
	else
		if intermedio <> menor then
			writeln('Orden de los números (menor a mayor): ', menor, ', ', intermedio, ', ', mayor)
		else
			writeln('Orden de los números (menor a mayor): ', menor, ', ', mayor);
end.