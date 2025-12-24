{* Dado un archivo que almacena datos de libros más pedidos en una biblioteca
online (entrada-lab-ej8.csv), cuyo formato de registro es:

(*) ISBN: AN(10)
(*) Título: AN(200)
(*) Autor: AN(200)
(*) Año: N(4)
(*) Editor: AN(200)

Se pide: ¿cuál es el porcentaje de libros con una antiguedad mayor a veinticinco
y menor a treinta años publicados por "Penguin Books" o "Loveswept"? *}

// NOTA: esta interpretación considera que se pide el porcentaje de libros que
// cumplan con el requisito de antiguedad sobre el total de libros publicados
// por las editoriales "Penguin Books" y "Loveswept".

// Necesito esta directiva de compilador para poder usar las palabras reservadas
// "try" y "finally".
{$mode objfpc}

program EJ8;

uses
    csvdocument,
    dateutils,
    sysutils;

type
    tipo_libro = record
        isbn: string[10];
        titulo: string[200];
        autor: string[200];
        anio: integer;
        editor: string[200];
    end;

var
    entrada_csv: TCSVDocument;
    libro: tipo_libro;

    fecha: TDateTime;
    i, cant_edit, cant_antig, anio_act, antig_libro: integer;
    porc_cant_antig: real;

procedure inicializar();
begin
    entrada_csv := TCSVDocument.Create();
    fecha := Now;
    anio_act := YearOf(fecha);
    cant_edit := 0;
    cant_antig := 0;
end;

begin
    inicializar();

    try
        entrada_csv.Delimiter := ';';
        entrada_csv.LoadFromFile('Materiales/entrada-lab-ej8.csv');

        for i := 1 to (entrada_csv.RowCount - 1) do
        begin
            if entrada_csv.Cells[0, i] <> '' then
                libro.isbn := entrada_csv.Cells[0, i]
            else
                libro.isbn := '-';

            if entrada_csv.Cells[1, i] <> '' then
                libro.titulo := entrada_csv.Cells[1, i]
            else
                libro.titulo := '-';

            if entrada_csv.Cells[2, i] <> '' then
                libro.autor := entrada_csv.Cells[2, i]
            else
                libro.autor := '-';

            if entrada_csv.Cells[3, i] <> '' then
                libro.anio := StrToInt(entrada_csv.Cells[3, i])
            else
                libro.anio := 0;

            if entrada_csv.Cells[4, i] <> '' then
                libro.editor := entrada_csv.Cells[4, i]
            else
                libro.editor := '-';

            if (libro.editor = 'Penguin Books') or (libro.editor = 'Loveswept') then
            begin
                cant_edit := cant_edit + 1;
                antig_libro := anio_act - libro.anio;

                if (antig_libro > 25) and (antig_libro < 30) then
                begin
                    cant_antig := cant_antig + 1;
                end;
            end;
        end;

        porc_cant_antig := (cant_antig * 100) / cant_edit;
        writeln('Porcentaje de libros que cumplen el requisito: ', porc_cant_antig:4:2);
    finally
        entrada_csv.free;
    end;
end.