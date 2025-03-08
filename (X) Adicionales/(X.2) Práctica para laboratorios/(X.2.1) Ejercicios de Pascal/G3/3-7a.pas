{* Crear un programa que lea el archivo creado en el ejercicio anterior (3-6b). *}

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

begin
    assign(entrada, 'Salidas/salida-ej6b.txt');

    try
        reset(entrada);

        while not eof(entrada) do
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

            // Si todavía hay más por leer, dibujo un separador entre los datos
            // de cada libro.
            draw_line(100, '=');
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
            writeln('Hubo un error al manipular el archivo de salida.');
            writeln('Tipo de error: ', E.ClassName);
            writeln('Descripción del error: "', E.Message, '"');
        end;
    end;
end.