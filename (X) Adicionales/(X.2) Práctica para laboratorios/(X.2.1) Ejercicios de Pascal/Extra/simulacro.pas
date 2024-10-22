{* Crear un programa que lea una lista de calificaciones (números enteros) desde
un archivo de texto y calcule el promedio de dichas calificaciones, determinando
cuántos estudiantes obtuvieron una calificación mayor o igual al promedio. El
programa también debe mostrar el promedio de calificaciones y el número de
estudiantes que superaron o igualaron el promedio. *}

// Material para este ejercicio:
// https://www.freepascal.org/docs-html/rtl/system/halt.html

program simulacro;

uses
	functions in '../functions.pas';

var
	entrada: TextFile;
	v_ent: integer;

	suma: LongInt;
	promedio: real;
	est_mayor_prom: integer;

procedure inicializar();
begin
	v_ent := 0;
	suma := 0;
	est_mayor_prom := 0;
end;

begin
	assign(entrada, 'Materiales/entrada-simulacro.txt');

	{$I-}
	reset(entrada);
	{$I+}

	if IOResult <> 0 then
		error_lectura_archivo()
	else
		inicializar();
		read(entrada, v_ent);

		while not eof(entrada) do
		begin
			suma := suma + v_ent;
			read(entrada, v_ent);
		end;

		promedio := suma / 1500;
		reset(entrada);

		while not eof(entrada) do
		begin
			if v_ent >= promedio then
			begin
				est_mayor_prom := est_mayor_prom + 1;
			end;

			read(entrada, v_ent);
		end;

		writeln('Promedio de calificaciones: ', promedio:4:2);
		writeln('Número de estudiantes con calificación mayor o igual al promedio: ', est_mayor_prom);

		close(entrada);
end.