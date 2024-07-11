{* Un supermercado necesita conocer el total de las ventas realizadas en un día.
El archivo "entrada-lab-ej1.txt" contiene los registros de ventas, con el código
del artículo vendido (cuatro caracteres) y el precio de venta (tres caracteres).

Ejemplo: 00012250001450003200

Es decir, se vendió el artículo 0001 por un importe de $225, luego el artículo
0001 nuevamente, por un importe de $450, y por último el artículo 0003 por un
importe de $200.

Se pide: ¿cuál es la cantidad de ventas que superaron el importe de $400? *}

program EJ1;

uses
	math;

type
	sec = TextFile;

var
	entrada: TextFile;
	v_ent: char;

	i, cant_ventas: integer;
	importe: LongInt;

function CharToInt(entrada: char): integer;
begin
	case entrada of
		'0': CharToInt := 0;
		'1': CharToInt := 1;
		'2': CharToInt := 2;
		'3': CharToInt := 3;
		'4': CharToInt := 4;
		'5': CharToInt := 5;
		'6': CharToInt := 6;
		'7': CharToInt := 7;
		'8': CharToInt := 8;
		'9': CharToInt := 9;
	end;
end;

procedure inicializar();
begin
	importe := 0;
	cant_ventas := 0;
end;

begin
	assign(entrada, 'Materiales/entrada-lab-ej1.txt');

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
				for i := 1 to 4 do
				begin
					read(entrada, v_ent);
				end;

				for i := 3 downto 1 do
				begin
					importe := importe + CharToInt(v_ent) * (10 ** (i - 1));
					read(entrada, v_ent);
				end;

				if importe > 400 then
				begin
					cant_ventas := cant_ventas + 1;
				end;
			end;

			writeln('Cantidad de ventas que superan los $400: ', cant_ventas);
			close(entrada)
		end;
end.