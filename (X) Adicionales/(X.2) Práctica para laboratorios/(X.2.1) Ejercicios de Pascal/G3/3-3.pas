{* Indicar el promedio de palabras por oración de una secuencia, localizada en
el archivo "entrada-ej2.txt". *}

// Necesito esta directiva de compilador para poder usar las palabras reservadas
// "try" y "except". También voy a utilizar con este fin la librería "sysutils".
{$mode objfpc}

program EJ3;

uses
    sysutils;

var
    entrada: file of char;
    v_ent: char;

    cont_palabras, cont_oraciones: integer;
    prom_palabras: real;

procedure inicializar();
begin
    cont_palabras := 0;
    cont_oraciones := 0;
end;

begin
    assign(entrada, 'Materiales/entrada-ej2.txt');

    try
        reset(entrada);
        inicializar();
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

            if v_ent = '.' then
            begin
                cont_oraciones := cont_oraciones + 1;
            end;
        end;

        prom_palabras := cont_palabras / cont_oraciones;
        writeln('El promedio de palabras por oración es de ', prom_palabras:4:2, ' palabras.');
        close(entrada);
    except
        on E: EInOutError do
        begin
            writeln('Hubo un error al manipular el archivo de entrada.');
            writeln('Tipo de error: ', E.ClassName);
            writeln('Descripción del error: "', E.Message, '"');
        end;
    end;
end.