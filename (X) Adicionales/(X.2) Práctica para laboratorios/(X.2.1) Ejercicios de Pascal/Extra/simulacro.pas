{* Crear un programa que lea una lista de calificaciones (números enteros) desde
un archivo de texto y calcule el promedio de dichas calificaciones, determinando
cuántos estudiantes obtuvieron una calificación mayor o igual al promedio. El
programa también debe mostrar el promedio de calificaciones y el número de
estudiantes que superaron o igualaron el promedio. *}

// Necesito esta directiva de compilador para poder usar las palabras reservadas
// "try" y "except". También voy a utilizar con este fin la librería "sysutils".
{$mode objfpc}

program simulacro;

uses
	sysutils;

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

	try
		reset(entrada);
		inicializar();
		read(entrada, v_ent);

		while not eof(entrada) do
		begin
			suma := suma + v_ent;
			read(entrada, v_ent);
		end;

		promedio := suma / 1500;
		close(entrada);

		try
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
		except
            on E: EInOutError do
            begin
                writeln('Hubo un error al manipular el archivo de entrada por segunda vez.');
                writeln('Tipo de error: ', E.ClassName);
                writeln('Descripción del error: "', E.Message, '"');
            end;
		end;
    except
        on E: EInOutError do
        begin
            writeln('Hubo un error al manipular el archivo de entrada por primera vez.');
            writeln('Tipo de error: ', E.ClassName);
            writeln('Descripción del error: "', E.Message, '"');
        end;
    end;
end.