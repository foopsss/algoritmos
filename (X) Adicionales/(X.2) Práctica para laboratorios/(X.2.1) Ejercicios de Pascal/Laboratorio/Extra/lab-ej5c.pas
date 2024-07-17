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
table booking = No) pero sí ofrecen delivery online (Has delivery online = Yes)? *}

{$mode objfpc}
program EJ5;

uses
	classes,
	sysutils;

type
	info_restaurante = record
		id: integer;
		nombre: string[200];
		codigo_pais: integer;
		ciudad: string[200];
		direccion: string[200];
		localidad: string[200];
		cocina: string[200];
		reserva_mesa: string[5];
		delivery_online: string[5];
		realizando_entregas: string[5];
		calif_agr: real;
		color_calif: string[30];
		texto_calif: string[20];
		votos: integer;
	end;

var
	entrada_csv: TStringList;
	v_csv: TStringList;
	restaurante: info_restaurante;

	i, cant_rest_cond: integer;

procedure inicializar();
begin
	entrada_csv := TStringList.Create();
	v_csv := TStringList.Create();
	cant_rest_cond := 0;
end;

begin
	inicializar();

	try
		v_csv.Delimiter := ';';
		v_csv.StrictDelimiter := true;

		entrada_csv.LoadFromFile('../Materiales/entrada-lab-ej5.csv');

		for i := 1 to (entrada_csv.count - 1) do
		begin
			v_csv.DelimitedText := entrada_csv[i];

			// En el archivo de entrada hay varias líneas que están parcialmente
			// vacías, ya que algunos campos no tienen información, por lo que
			// debo lidiar con esa posibilidad.
			if v_csv[0] <> '' then
				restaurante.id := StrToInt(v_csv[0])
			else
				restaurante.id := 0;

			if v_csv[1] <> '' then
				restaurante.nombre := v_csv[1]
			else
				restaurante.nombre := '-';

			if v_csv[2] <> '' then
				restaurante.codigo_pais := StrToInt(v_csv[2])
			else
				restaurante.codigo_pais := 0;

			if v_csv[3] <> '' then
				restaurante.ciudad := v_csv[3]
			else
				restaurante.ciudad := '-';

			if v_csv[4] <> '' then
				restaurante.direccion := v_csv[4]
			else
				restaurante.direccion := '-';

			if v_csv[5] <> '' then
				restaurante.localidad := v_csv[5]
			else
				restaurante.localidad := '-';

			if v_csv[6] <> '' then
				restaurante.cocina := v_csv[6]
			else
				restaurante.cocina := '-';

			if v_csv[7] <> '' then
				restaurante.reserva_mesa := v_csv[7]
			else
				restaurante.reserva_mesa := '-';

			if v_csv[8] <> '' then
				restaurante.delivery_online := v_csv[8]
			else
				restaurante.delivery_online := '-';

			if v_csv[9] <> '' then
				restaurante.realizando_entregas := v_csv[9]
			else
				restaurante.realizando_entregas := '-';

			if v_csv[10] <> '' then
				restaurante.calif_agr := StrToFloat(v_csv[10])
			else
				restaurante.calif_agr := 0;

			if v_csv[11] <> '' then
				restaurante.color_calif := v_csv[11]
			else
				restaurante.color_calif := '-';

			if v_csv[12] <> '' then
				restaurante.texto_calif := v_csv[12]
			else
				restaurante.texto_calif := '-';

			if v_csv[13] <> '' then
				restaurante.calif_agr := StrToFloat(v_csv[13])
			else
				restaurante.calif_agr := 0;

			if (restaurante.reserva_mesa = 'No') and (restaurante.delivery_online = 'Yes') then
			begin
				cant_rest_cond := cant_rest_cond + 1;
			end;
		end;

		writeln('Cantidad de restaurantes que cumplen la condición: ', cant_rest_cond);
	finally
		entrada_csv.free;
		v_csv.free;
	end;
end.