{* Se tiene un archivo que almacena datos de jugadoras de FIFA a nivel mundial
(entrada-lab-ej4.csv) y contiene la siguiente información: ID de la jugadora,
versión de FIFA, nombre de la jugadora, edad, altura, peso, país de nacimiento
y pie preferido.

Se pide: ¿cuál es el porcentaje de jugadoras de treinta años o más que prefieren
utilizar el pie derecho para patear? *}

// ACLARACIÓN: esta resolución no utiliza registros, sino que trata cada línea
// del archivo como un arreglo.

// Material para este ejercicio:
// https://wiki.freepascal.org/File_Handling_In_Pascal
// https://wiki.freepascal.org/Exceptions
// https://www.freepascal.org/docs-html/rtl/sysutils/index-4.html

// Necesito esta directiva de compilador para poder usar las palabras reservadas
// "try" y "except". También voy a utilizar con este fin la librería "sysutils".
//
// No utilizo "finally", como en las versiones principales de los ejercicios de
// laboratorio, porque acá no hay tareas de limpieza que yo deba llevar a cabo
// irrespectivamente de si pude cargar el archivo en memoria o no.
//
// Si no logro abrir el archivo, simplemente voy a mostrar un error en pantalla
// con un exception.
{$mode objfpc}

program EJ4;

uses
    functions in '../../functions.pas',
    sysutils;

var
    entrada_csv: TextFile;
    v_csv: string;

    i, col_linea: integer;
    cant_jugadoras, edad_jugadora, der_treinta: integer;
    resg_pie: char;
    porc_der_treinta: real;

procedure inicializar();
begin
    col_linea := 1;
    cant_jugadoras := 0;
    edad_jugadora := 0;
    der_treinta := 0;
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
    assign(entrada_csv, '../Materiales/entrada-lab-ej4.csv');

    try
        reset(entrada_csv);
        inicializar();

        // El archivo de entrada tiene una cabecera,
        // por lo que debo saltarla.
        //
        // En la ventana (v_csv) almaceno una línea
        // del archivo.
        for i := 1 to 2 do
        begin
            readln(entrada_csv, v_csv);
        end;

        while not eof(entrada_csv) do
        begin
            // Cuento la cantidad de jugadoras.
            cant_jugadoras := cant_jugadoras + 1;

            // Recorro cada línea del archivo como
            // un arreglo, ya que un dato del tipo
            // "string" es un arreglo de caracteres.
            //
            // Primero avanzo los caracteres hasta
            // situarme en la cuarta celda, la de
            // la edad.
            for i := 1 to 3 do
            begin
                avanzar_columnas();
            end;

            edad_jugadora := edad_jugadora + CharToInt(v_csv[col_linea]) * 10;
            edad_jugadora := edad_jugadora + CharToInt(v_csv[col_linea + 1]);

            // Repito el mismo proceso, pero ahora para
            // llegar al pie preferido, la última celda
            // de cada fila.
            for i := 1 to 4 do
            begin
                avanzar_columnas();
            end;

            resg_pie := v_csv[col_linea];

            if (edad_jugadora >= 30) and (resg_pie = 'R') then
            begin
                der_treinta := der_treinta + 1;
            end;

            // Reseteo las variables necesarias y paso
            // a la siguiente línea del archivo.
            col_linea := 1;
            edad_jugadora := 0;
            readln(entrada_csv, v_csv);
        end;

        porc_der_treinta := (der_treinta * 100) / cant_jugadoras;
        writeln('Porcentaje de jugadoras que cumplen la condición: ', porc_der_treinta:4:2);
        close(entrada_csv);
    except
        on E: EInOutError do
        begin
            writeln('Hubo un error al manipular el archivo.');
            writeln('Tipo de error: ', E.ClassName);
            writeln('Descripción del error: "', E.Message, '"');
        end;
    end;
end.