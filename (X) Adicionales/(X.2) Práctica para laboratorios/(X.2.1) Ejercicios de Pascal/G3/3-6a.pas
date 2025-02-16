{* Crear un programa que permita cargar un archivo con el formato de libros
dado en el ejercicio 3-1. El algoritmo debe preguntarle al usuario en cada
iteración si desea salir o cargar otro libro. *}

// Necesito esta directiva de compilador para poder usar las palabras reservadas
// "try" y "except". También voy a utilizar con este fin la librería "sysutils".
{$mode objfpc}

program EJ6;

uses
    functions in '../functions.pas',
    sysutils;

type
    Libro = record
        titulo: string[100];
        autor: string[100];
        resumen: string[100];
        id_libro: LongInt;
    end;

var
    salida: TextFile;
    def_libro: Libro;

    borrar_archivo: boolean;
    eleccion: char;

begin
    assign(salida, 'Salidas/salida-ej6a.txt');

    try
        rewrite(salida);

        // La variable "borrar_archivo" se usa al final del ciclo
        // para controlar si se le introdujo contenido al archivo
        // o no.
        borrar_archivo := true;

        write('¿Desea cargar información sobre un libro? [S/N]: ');
        readln(eleccion);

        while eleccion = 'S' do
        begin
            borrar_archivo := false;

            write('Introduzca el título del libro: ');
            readln(def_libro.titulo);

            write('Introduzca el nombre del autor del libro: ');
            readln(def_libro.autor);

            write('Introduzca un resumen del libro (máximo 100 caracteres): ');
            readln(def_libro.resumen);

            write('Introduzca la ID del libro: ');
            readln(def_libro.id_libro);

            // Grabo la ID del libro solo con un "write" para no
            // dejar una línea en blanco al final del archivo.
            writeln(salida, def_libro.titulo);
            writeln(salida, def_libro.autor);
            writeln(salida, def_libro.resumen);
            write(salida, def_libro.id_libro);

            draw_line(55, '=');
            write('¿Desea cargar información sobre otro libro? [S/N]: ');
            readln(eleccion);
        end;

        close(salida);

        // Aún si el usuario decide no ponerle contenido al
        // archivo, este se va a crear igual. Lo correcto
        // sería borrarlo al final del proceso si solo va a
        // ser un archivo vacío.
        if borrar_archivo then
            erase(salida);
    except
        on E: EInOutError do
        begin
            writeln('Hubo un error al manipular el archivo de salida.');
            writeln('Tipo de error: ', E.ClassName);
            writeln('Descripción del error: "', E.Message, '"');
        end;
    end;
end.