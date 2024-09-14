{* Contar todas las palabras de una secuencia, localizada en el archivo
"entrada-ej2.txt". *}

program EJ2;

uses
	functions in '../functions.pas';

var
	entrada: file of char;
	v_ent: char;

	cont_palabras: integer;

begin
	assign(entrada, 'Materiales/entrada-ej2.txt');

	{$I-}
	reset(entrada);
	{$I+}

	if IOResult <> 0 then
		error_lectura_archivo()
	else
		begin
			cont_palabras := 0;
			read(entrada, v_ent);

			while not eof(entrada) do
			begin
				while (v_ent = ' ') or (v_ent = '.') do
				begin
					read(entrada, v_ent);
				end;

				cont_palabras := cont_palabras + 1;

				while (v_ent <> ' ') and (v_ent <> '.') do
				begin
					read(entrada, v_ent);
				end;
			end;

			writeln('Cantidad de palabras en el archivo: ', cont_palabras);
			close(entrada);
		end;
end.