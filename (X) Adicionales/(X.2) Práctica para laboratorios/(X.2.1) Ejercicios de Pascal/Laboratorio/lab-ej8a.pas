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
// cumplan con el requisito de antiguedad y ser publicados por las editoriales
// "Penguin Books" y "Loveswept" por sobre el total de libros del archivo.

// Material para este ejercicio:
// https://www.freepascal.org/docs-html/rtl/sysutils/now.html
// https://www.freepascal.org/docs-html/rtl/dateutils/yearof.html
// https://www.freepascal.org/docs-html/rtl/system/tdatetime.html

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

    // TDateTime es un tipo de dato provisto por la librería "dateutils", que
    // sirve justamente para almacenar la fecha y la hora.
    // Luego, con la función YearOf() de la librería "sysutils" extraigo el año
    // actual, almacenado en la variable fecha, la cual contiene la fecha y hora
    // actuales al momento de correr el programa, conseguidos gracias a la
    // función "now", también disponible en sysutils.
    fecha: TDateTime;
    i, cant_lib, cant_antig, anio_act, antig_libro: integer;
    porc_cant_antig: real;

procedure inicializar();
begin
    entrada_csv := TCSVDocument.Create();
    fecha := Now;
    anio_act := YearOf(fecha);
    cant_lib := 0;
    cant_antig := 0;
end;

begin
    inicializar();

    try
        entrada_csv.Delimiter := ';';
        entrada_csv.LoadFromFile('Materiales/entrada-lab-ej8.csv');

        for i := 1 to (entrada_csv.RowCount - 1) do
        begin
            cant_lib := cant_lib + 1;

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
                antig_libro := anio_act - libro.anio;
                if (antig_libro > 25) and (antig_libro < 30) then
                begin
                    cant_antig := cant_antig + 1;
                end;
            end;
        end;

        porc_cant_antig := (cant_antig * 100) / cant_lib;
        writeln('Porcentaje de libros que cumplen el requisito: ', porc_cant_antig:4:2);
    finally
        entrada_csv.free;
    end;
end.