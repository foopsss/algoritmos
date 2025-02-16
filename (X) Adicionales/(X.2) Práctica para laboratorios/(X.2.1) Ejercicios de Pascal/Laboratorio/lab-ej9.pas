{* Un ministerio de la Provincia del Chaco necesita procesar datos del último
Censo Nacional de Población, Hogares y Viviendas 2022 (Censo 2022) realizado por
el INDEC.

Para ello, dispone de un archivo de texto (entrada-lab-ej9.txt) que
contiene información de la Provincia del Chaco: número de vivienda (cantidad de
caracteres indeterminada que termina con "#"), tipo de vivienda ("P" - particular
o "C" - colectiva) y condición de la vivienda ("Y" - muy buena, "B" - buena o
"M" - mala).

Se pide: ¿qué porcentaje de viviendas "particulares" de condición "muy buena"
existen sobre el total de viviendas "particulares"? *}

// Necesito esta directiva de compilador para poder usar las palabras reservadas
// "try" y "except". También voy a utilizar con este fin la librería "sysutils".
{$mode objfpc}

program EJ9;

uses
    sysutils;

var
    entrada: TextFile;
    v_ent: char;

    cant_part, cant_part_mb: integer;
    es_part, es_mb: boolean;
    porc_part_mb: real;

procedure inicializar();
begin
    cant_part := 0;
    cant_part_mb := 0;
end;

begin
    assign(entrada, 'Materiales/entrada-lab-ej9.txt');

    try
        reset(entrada);
        inicializar();
        read(entrada, v_ent);

        while not eof(entrada) do
        begin
            es_part := false;
            es_mb := false;

            while v_ent <> '#' do
            begin
                read(entrada, v_ent);
            end;

            // Salto el numeral.
            read(entrada, v_ent);

            if v_ent = 'P' then
            begin
                es_part := true;
                cant_part := cant_part + 1;
            end;

            read(entrada, v_ent);

            if v_ent = 'Y' then
            begin
                es_mb := true;
            end;

            if (es_part) and (es_mb) then
            begin
                cant_part_mb := cant_part_mb + 1;
            end;

            read(entrada, v_ent);
        end;

        porc_part_mb := (cant_part_mb * 100) / cant_part;
        writeln('Porcentaje de viviendas que cumplen la condición: ', porc_part_mb:4:2);
        close(entrada);
    except
        on E: EInOutError do
        begin
            writeln('Hubo un error al manipular el archivo.');
            writeln('Tipo de error: ', E.ClassName);
            writeln('Descripción del error: "', E.Message, '"');
        end;
    end;
end.