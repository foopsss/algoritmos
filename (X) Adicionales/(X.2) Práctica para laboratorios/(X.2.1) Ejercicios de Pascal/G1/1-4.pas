{* Escribir un programa en pascal que dado dos números reales realice la
suma, resta, multiplicación, división entera y resto de los mismos. Los
números son: X = 55 e Y = 30. *}

// Material para este ejercicio:
// https://wiki.freepascal.org/Basic_Pascal_Tutorial/Chapter_2/Formatting_output

program EJ4;

var
	x, y: real;
	suma, resta, mult, div_real: real;

begin
	x := 55;
	y := 30;

	suma := x + y;
	resta := x - y;
	mult := x * y;
	div_real := x / y;

	writeln('Valor de X: ', x:4:2);
	writeln('Valor de Y: ', y:4:2);

	// Los resultados están acortados a dos decimales y utilizan notación
	// de punto fijo (fixed-point notation) para ser mostrados en un formato
	// más amigable a la vista.
	writeln();
	writeln('Suma: ', suma:4:2);
	writeln('Resta: ', resta:4:2);
	writeln('Multiplicación: ', mult:4:2);
	writeln('División real: ', div_real:4:2);
end.