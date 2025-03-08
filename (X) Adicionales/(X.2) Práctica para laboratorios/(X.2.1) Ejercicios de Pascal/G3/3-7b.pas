{* Crear un programa que lea el archivo creado en el ejercicio anterior (3-6b).
Incorporar la funcionalidad de pasar al próximo libro cuando uno lo necesite. *}

// Necesito esta directiva de compilador para poder usar las palabras reservadas
// "try" y "except". También voy a utilizar con este fin la librería "sysutils".
{$mode objfpc}

program EJ7;

uses
    functions in '../functions.pas',
    sysutils;

var
    entrada: TextFile;
    v_ent: string[200];

    eleccion: char;

begin
    assign(entrada, 'Salidas/salida-ej6b.txt');

    try
        reset(entrada);
        write('¿Desea leer información sobre un libro? [S/N]: ');
        readln(eleccion);

        while (not eof(entrada)) and (eleccion = 'S') do
        begin
            // Con este readln voy a avanzar a la primera línea del archivo, o
            // me voy a saltar la línea en blanco que separa los datos de cada
            // libro.
            readln(entrada, v_ent);

            // Datos de cada libro.
            writeln('Nombre: ', v_ent);
            readln(entrada, v_ent);
            writeln('Autor: ', v_ent);
            readln(entrada, v_ent);
            writeln('Resumen del libro: ', v_ent);
            readln(entrada, v_ent);
            writeln('ID: ', v_ent);

            // Con este readln voy a pasar a la próxima línea en blanco, si hay
            // más libros, o voy a llegar al fin del archivo.
            readln(entrada, v_ent);
            draw_line(100, '=');

            // Si todavía hay más por leer, dibujo un separador entre los datos
            // de cada libro le pregunto al usuario si desea continuar.
            if not eof(entrada) then
            begin
                write('¿Desea leer información sobre otro libro? [S/N]: ');
                readln(eleccion);
            end;
        end;

        if eof(entrada) then
        begin
            writeln('Se ha llegado al final del archivo.');
            writeln('No hay más información para leer.');
        end;

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