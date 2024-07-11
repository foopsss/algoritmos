{* Un banco necesita saber cuáles son las operaciones válidas luego de realizar
varias transacciones. El archivo "entrada-lab-ej2.txt" contiene registros de
transacciones, con número de transacción (termina con "#"), tipo de transacción
("D" para depósito y "R" para retiro) y un carácter que indica si la operación
ha sido válida ("S" o "N").

Se pide: ¿qué porcentaje representan las operaciones no válidas del tipo depósito
sobre el total de operaciones? *}

program EJ2;

type
	sec = TextFile;

var
	entrada: TextFile;
	v_ent: char;

	es_dep, no_val: boolean;
	cont_op, noval_dep: integer;
	porc_noval_dep: real;

procedure inicializar();
begin
	cont_op := 0;
	noval_dep := 0;
end;

begin
	assign(entrada, 'Materiales/entrada-lab-ej2.txt');

	{$I-}
	reset(entrada);
	{$I+}

	if IOResult <> 0 then
		begin
			writeln('¡Error!');
			halt(1);
		end
	else
		begin
			inicializar();
			read(entrada, v_ent);

			while not eof(entrada) do
			begin
				cont_op := cont_op + 1;

				while v_ent <> '#' do
				begin
					read(entrada, v_ent);
				end;

				// Avanzo el numeral.
				read(entrada, v_ent);

				if v_ent = 'D' then
					begin
						es_dep := true;
					end
				else
					begin
						es_dep := false;
					end;

				read(entrada, v_ent);

				if v_ent = 'N' then
					begin
						no_val := true;
					end
				else
					begin
						no_val := false;
					end;

				if (es_dep) and (no_val) then
				begin
					noval_dep := noval_dep + 1;
				end;

				read(entrada, v_ent);
			end;

			porc_noval_dep := (noval_dep * 100) / cont_op;
			writeln('Porcentaje de operaciones no válidas del tipo depósito: ', porc_noval_dep:10:2);

			close(entrada)
		end;
end.