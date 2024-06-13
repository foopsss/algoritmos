{* Escribir un programa en pascal que dado dos números enteros realice la
suma, resta, multiplicación, división entera y resto de los mismos. Los
números son: X = 55 e Y = 30. *}

program EJ1;

var
	x, y: integer;
	suma, resta, mult, div_ent, resto: integer;

begin
	x := 55;
	y := 30;

	suma := x + y;
	resta := x - y;
	mult := x * y;
	div_ent := x div y;
	resto := x mod y;

	writeln('Valor de X: ', x);
	writeln('Valor de Y: ', y);

	writeln();
	writeln('Suma: ', suma);
	writeln('Resta: ', resta);
	writeln('Multiplicación: ', mult);
	writeln('División entera: ', div_ent);
	writeln('Resto: ', resto);
end.