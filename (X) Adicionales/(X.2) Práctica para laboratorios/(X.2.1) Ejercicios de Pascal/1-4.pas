{* Escribir un programa en pascal que dado dos números reales realice la
suma, resta, multiplicación, división entera y resto de los mismos. Tanto
X como Y deben ser ingresados por el usuario. *}

// Material para este ejercicio:
// https://wiki.freepascal.org/Basic_Pascal_Tutorial/Chapter_2/Formatting_output

program EJ4;

var
	x, y: real;
	suma, resta, mult, div_real: real;

begin
	write('Introduzca un valor para X: ');
	readln(x);

	write('Introduzca un valor para Y: ');
	readln(y);

	suma := x + y;
	resta := x - y;
	mult := x * y;
	div_real := x / y;

	writeln('Valor de X: ', x);
	writeln('Valor de Y: ', y);

	// Los resultados están acortados a dos decimales y utilizan notación
	// de punto fijo (fixed-point notation) para ser mostrados en un formato
	// más amigable a la vista.
	writeln('');
	writeln('Suma: ', suma:10:2);
	writeln('Resta: ', resta:10:2);
	writeln('Multiplicación: ', mult:10:2);
	writeln('División entera: ', div_real:10:2);
end.