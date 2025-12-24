{* Usando el tipo de dato "record", crear una subacción que permita cargar a
mano tres libros en memoria. Para cada libro se debe almacenar el título, el
nombre del autor, un pequeño resumen de este y la ID del libro. Tras cargar
los libros en memoria se los debe listar en pantalla. *}

// Material para este ejercicio:
// https://wiki.freepascal.org/Basic_Pascal_Tutorial/Chapter_4/Parameters

program EJ1;

uses
    functions in '../functions.pas';

type
    Libro = record
        titulo: string[100];
        autor: string[100];
        resumen: string[100];
        id_libro: LongInt;
    end;

var
    libro1, libro2, libro3: Libro;

procedure inicializar();
begin
    libro1.titulo := '';
    libro1.autor := '';
    libro1.resumen := '';
    libro1.id_libro := 0;

    libro2.titulo := '';
    libro2.autor := '';
    libro2.resumen := '';
    libro2.id_libro := 0;

    libro3.titulo := '';
    libro3.autor := '';
    libro3.resumen := '';
    libro3.id_libro := 0;
end;

procedure cargar_libro(VAR libro_ent: Libro);
begin
    // Este procedimiento utiliza paso de parámetros
    // por referencia, ya que de esa forma puedo cargar
    // en los registros los valores que introduce el
    // usuario con este procedimiento.
    write('Introduzca el título del libro: ');
    readln(libro_ent.titulo);
    write('Introduzca el autor del libro: ');
    readln(libro_ent.autor);
    write('Introduzca un resumen del libro: ');
    readln(libro_ent.resumen);
    write('Introduzca la ID del libro: ');
    readln(libro_ent.id_libro);
end;

procedure mostrar_libro(libro_ent: Libro);
begin
    writeln('Título del libro: ', libro_ent.titulo);
    writeln('Autor del libro: ', libro_ent.autor);
    writeln('Resumen del libro: ', libro_ent.resumen);
    writeln('ID del libro: ', libro_ent.id_libro);
end;

begin
    inicializar();

    cargar_libro(libro1);
    draw_line(50);
    cargar_libro(libro2);
    draw_line(50);
    cargar_libro(libro3);
    draw_line(50, '=');

    mostrar_libro(libro1);
    draw_line(50);
    mostrar_libro(libro2);
    draw_line(50);
    mostrar_libro(libro3);
end.