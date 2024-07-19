{* Se tiene un archivo (entrada-lab-ej5.csv) que contiene datos de restaurantes
del mundo con la siguiente información:

(*) ID del restaurante: N(12).
(*) Nombre del restaurante: AN(200).
(*) Código de país: N(3).
(*) Ciudad: AN(200).
(*) Dirección: AN(200).
(*) Localidad: AN(200).
(*) Cocina: AN(200).
(*) Tiene reserva de mesa: ("YES", "NO").
(*) Tiene delivery online: ("YES", "NO").
(*) Está realizando entregas: ("YES", "NO").
(*) Calificación agregada: N(4,2).
(*) Color de la calificación: AN(30).
(*) Texto de la calificación: ("Excellent", "Very Good", "Good", "Poor",
    "Average", "Not rated").
(*) Votos: N(3).

Se pide: ¿cuál es la cantidad de restaurantes que no tienen reserva de mesa (Has
table booking = No) pero sí ofrecen delivery online (Has online delivery = Yes)? *}

// ACLARACIÓN: esta resolución no utiliza registros, sino que trata cada línea
// del archivo como un arreglo, de la misma forma que en el archivo "lab-ej4b.pas".

program EJ5;

uses
	functions in '../../functions.pas';

type
	csv = TextFile;

var
	entrada_csv: csv;
	v_csv: string;

	i, col_linea: integer;
	resg_table_booking, resg_delivery: char;
	cant_rest_cond: integer;

procedure inicializar();
begin
	col_linea := 1;
	cant_rest_cond := 0;
end;

procedure avanzar_columnas();
begin
	while v_csv[col_linea] <> ';' do
	begin
		col_linea := col_linea + 1;
	end;

	col_linea := col_linea + 1;
end;

begin
	assign(entrada_csv, '../Materiales/entrada-lab-ej5.csv');

	{$I-}
	reset(entrada_csv);
	{$I+}

	if IOResult <> 0 then
		error_lectura_archivo()
	else
		begin
			inicializar();

			// El archivo de entrada tiene una cabecera,
			// por lo que debo saltarla.
			for i := 1 to 2 do
			begin
				readln(entrada_csv, v_csv);
			end;

			while not eof(entrada_csv) do
			begin
				// Primero avanzo los caracteres hasta
				// situarme en la octava celda, la que
				// indica si hay reserva de mesa.
				for i := 1 to 7 do
				begin
					avanzar_columnas();
				end;

				resg_table_booking := v_csv[col_linea];

				// Avanzo hasta la novena celda, que indica
				// si hay delivery online.
				avanzar_columnas();
				resg_delivery := v_csv[col_linea];

				if (resg_table_booking = 'N') and (resg_delivery = 'Y') then
				begin
					cant_rest_cond := cant_rest_cond + 1;
				end;

				// Reseteo las variables necesarias y paso
				// a la siguiente línea del archivo.
				col_linea := 1;
				readln(entrada_csv, v_csv);
			end;

			writeln('Cantidad de restaurantes que cumplen la condición: ', cant_rest_cond);
			close(entrada_csv)
		end;
end.