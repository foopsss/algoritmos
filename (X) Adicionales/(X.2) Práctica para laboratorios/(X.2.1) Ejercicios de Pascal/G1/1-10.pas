{*
Determinar si un número es primo. Se lo puede hacer con
el siguiente seudocódigo:

Acción EJ10 ES

Ambiente

	num, aux: entero
	esPrimo: lógico

Proceso

	Escribir(“Por favor ingrese un número para saber si es entero”)
	leer(num)

	aux := 2
	esPrimo := Verdadero

	Mientras esPrimo y aux < num Hacer
		Si num mod aux = 0 Entonces
			esPrimo := falso
		Fin Si
		aux := aux + 1
	Fin Mientras

	Si esPrimo Entonces
		Escribir(“El número ingresado es Primo”)
	Contrario
		Escribir(“El número ingresado no es primo”)
	Fin Si

Fin Acción
*}

program EJ10;

var
	numero, auxiliar: integer;
	esPrimo: boolean;

begin
	write('Introduzca un número: ');
	readln(numero);

	auxiliar := 2;
	esPrimo := true;

	while (esPrimo) and (auxiliar < numero) do
	begin
		if numero mod auxiliar = 0 then
		begin
			esPrimo := false;
		end;
		auxiliar := auxiliar + 1;
	end;

	writeln();
	if esPrimo then
		begin
			writeln('El número es primo.');
		end
	else
		begin
			writeln('El número NO es primo.');
		end;
end.