{* Contar todas las palabras de una secuencia, localizada en el archivo
"entrada-ej2.txt". *}

// Necesito esta directiva de compilador para poder usar las palabras reservadas
// "try" y "except". También voy a utilizar con este fin la librería "sysutils".
{$mode objfpc}

program EJ2;

uses
    sysutils;

var
    entrada: file of char;
    v_ent: char;

    cont_palabras: integer;

begin
    assign(entrada, 'Materiales/entrada-ej2.txt');

    try
        reset(entrada);
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

        writeln('Cantidad de palabras en la secuencia: ', cont_palabras);
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