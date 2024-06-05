{* En un colegio primario se necesita realizar un algoritmo que en vez de
colocar las notas de los alumnos en forma numérica, la misma debe ser con
una frase. El algoritmo debe traducir las notas del 0 al 10 en las
siguientes frases:

- De 0 a 3: Mal
- De 4 a 5: Insuficiente
- De 6 a 7: Bien
- De 8 a 9: Sobresaliente
- Cuando es 10: Perfecto

Para valores mayores a 10 o menores a 0 se debe evitar que el programa
salga (número fuera de rango) y se debe volver a solicitar una nota.

Se debe realizar el proceso para una cantidad indeterminada de alumnos y
luego calcular el promedio de las notas de estos. *}

program EJ9;

var
	eleccion: char;
	nota, cant_notas, suma_notas: integer;
	prom_notas: real;

procedure pedir_eleccion;
begin
	write('¿Desea introducir una nota? [S/N]: ');
	read(eleccion);
end;

procedure pedir_nota;
begin
	write('Introduzca la nota del alumno: ');
	readln(nota);
end;

procedure draw_line(length: integer);
var
	i: integer;
begin
	for i := 0 to (length - 1) do
	begin
		write('-');
	end;
	writeln('-');
end;

begin
	suma_notas := 0;
	cant_notas := 0;
	pedir_eleccion;

	while eleccion = 'S' do
	begin
		repeat
			pedir_nota;

			writeln('');
			if not (nota in [0..10]) then
			begin
				writeln('Número fuera de rango.');
				writeln('Introduzca un número correcto.');
				draw_line(35);
			end;
		until nota in [0..10];

		case nota of
			0..3: writeln('Mal.');
			4..5: writeln('Insuficiente.');
			6..7: writeln('Bien.');
			8..9: writeln('Sobresaliente.');
			10: writeln('Perfecto.');
		end;

		cant_notas := cant_notas + 1;
		suma_notas := suma_notas + nota;

		draw_line(35);
		pedir_eleccion;
	end;

	if eleccion = 'N' then
	begin
		draw_line(35);
	end;

	prom_notas := suma_notas / cant_notas;
	writeln('Promedio de las notas: ', prom_notas:10:2);
end.