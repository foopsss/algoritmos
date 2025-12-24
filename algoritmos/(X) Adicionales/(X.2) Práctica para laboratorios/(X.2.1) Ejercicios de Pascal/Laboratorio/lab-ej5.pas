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

{$mode objfpc}
program EJ5;

uses
    csvdocument,
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
    entrada_csv: TCSVDocument;
    restaurante: info_restaurante;

    i, cant_rest_cond: integer;

procedure inicializar();
begin
    entrada_csv := TCSVDocument.Create();
    cant_rest_cond := 0;
end;

begin
    inicializar();

    try
        entrada_csv.Delimiter := ';';
        entrada_csv.LoadFromFile('Materiales/entrada-lab-ej5.csv');

        for i := 1 to (entrada_csv.RowCount - 1) do
        begin
            // En el archivo de entrada hay varias líneas que están parcialmente
            // vacías, ya que algunos campos no tienen información, por lo que
            // debo lidiar con esa posibilidad.
            if entrada_csv.Cells[0, i] <> '' then
                restaurante.id := StrToInt(entrada_csv.Cells[0, i])
            else
                restaurante.id := 0;

            if entrada_csv.Cells[1, i] <> '' then
                restaurante.nombre := entrada_csv.Cells[1, i]
            else
                restaurante.nombre := '-';

            if entrada_csv.Cells[2, i] <> '' then
                restaurante.codigo_pais := StrToInt(entrada_csv.Cells[2, i])
            else
                restaurante.codigo_pais := 0;

            if entrada_csv.Cells[3, i] <> '' then
                restaurante.ciudad := entrada_csv.Cells[3, i]
            else
                restaurante.ciudad := '-';

            if entrada_csv.Cells[4, i] <> '' then
                restaurante.direccion := entrada_csv.Cells[4, i]
            else
                restaurante.direccion := '-';

            if entrada_csv.Cells[5, i] <> '' then
                restaurante.localidad := entrada_csv.Cells[5, i]
            else
                restaurante.localidad := '-';

            if entrada_csv.Cells[6, i] <> '' then
                restaurante.cocina := entrada_csv.Cells[6, i]
            else
                restaurante.cocina := '-';

            if entrada_csv.Cells[7, i] <> '' then
                restaurante.reserva_mesa := entrada_csv.Cells[7, i]
            else
                restaurante.reserva_mesa := '-';

            if entrada_csv.Cells[8, i] <> '' then
                restaurante.delivery_online := entrada_csv.Cells[8, i]
            else
                restaurante.delivery_online := '-';

            if entrada_csv.Cells[9, i] <> '' then
                restaurante.realizando_entregas := entrada_csv.Cells[9, i]
            else
                restaurante.realizando_entregas := '-';

            if entrada_csv.Cells[10, i] <> '' then
                restaurante.calif_agr := StrToFloat(entrada_csv.Cells[10, i])
            else
                restaurante.calif_agr := 0;

            if entrada_csv.Cells[11, i] <> '' then
                restaurante.color_calif := entrada_csv.Cells[11, i]
            else
                restaurante.color_calif := '-';

            if entrada_csv.Cells[12, i] <> '' then
                restaurante.texto_calif := entrada_csv.Cells[12, i]
            else
                restaurante.texto_calif := '-';

            if entrada_csv.Cells[13, i] <> '' then
                restaurante.calif_agr := StrToFloat(entrada_csv.Cells[13, i])
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
    end;
end.