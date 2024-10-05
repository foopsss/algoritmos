{* A partir de la secuencia localizada en el archivo "entrada-ej2.txt", generar
una secuencia de salida que posea todas las palabras que comienzan con vocal. *}

program EJ4;

uses
	functions in '../functions.pas';

const
	vocales = ['a', 'e', 'i', 'o', 'u'];

var
	entrada, salida: file of char;
	v_ent: char;

	palabras_vocales: integer;
	palabra_con_vocal: boolean;

begin
	assign(entrada, 'Materiales/entrada-ej2.txt');
	assign(salida, 'Salidas/salida-ej4.txt');

	{$I-}
	reset(entrada);
	rewrite(salida);
	{$I+}

	if IOResult <> 0 then
		error_lectura_archivo()
	else
		begin
			palabras_vocales := 0;
			read(entrada, v_ent);

			while not eof(entrada) do
			begin
				while (v_ent = ' ') or (v_ent = '.') do
				begin
					read(entrada, v_ent);
				end;

				if v_ent in vocales then
					begin
						palabras_vocales := palabras_vocales + 1;
						palabra_con_vocal := true;
					end
				else
					palabra_con_vocal := false;

				while (v_ent <> ' ') and (v_ent <> '.') do
				begin
					if palabra_con_vocal then
					begin
						if (v_ent <> ',') and (v_ent <> '.') then
						begin
							write(salida, v_ent);
						end;
					end;

					read(entrada, v_ent);
				end;

				if palabra_con_vocal then
				begin
					write(salida, ' ');
				end;
			end;

			writeln('Número de palabras que comienzan con vocal: ', palabras_vocales);
			close(entrada);
			close(salida);
		end;
end.