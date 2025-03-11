{* Este programa sirve para inspeccionar el contenido de los archivos que generé
a lo largo de este ejercicio, dado que no se tratan de texto plano y no se puede
simplemente abrirlos con un editor de texto cualquiera. El contenido se muestra
de la manera más amigable posible, con explicaciones sobre qué significa cada
cosa.

En los archivos correspondientes a las consignas previas me explayé un poco sobre
el porqué de usar el formato ".dat". *}

// Necesito esta directiva de compilador para poder usar las palabras reservadas
// "try" y "except". También voy a utilizar con este fin la librería "sysutils".
{$mode objfpc}

program EJ8;

uses
    functions in '../functions.pas',
    sysutils;

type
    empleado = record
        planta: char;
        categoria: integer;
        nombre: string[100];
    end;

    planta = record
        planta: char;
        cant_emp: integer;
    end;

var
    entrada_emp, entrada_cat_cuatro: file of empleado;
    entrada_emp_planta: file of planta;
    reg_emp, reg_cat_cuatro: empleado;
    reg_planta: planta;

procedure mostrar_empleado(reg: empleado);
begin
    writeln('Planta del empleado: ', reg.planta);
    writeln('Categoria del empleado: ', reg.categoria);
    writeln('Nombre del empleado: ', reg.nombre);
end;

procedure mostrar_planta(reg: planta);
begin
    writeln('Planta: ', reg.planta);
    writeln('Cantidad de empleados: ', reg.cant_emp);
end;

begin
    assign(entrada_emp, 'Salidas/salida-ej8-gen.dat');
    assign(entrada_cat_cuatro, 'Salidas/salida-ej8-cat-cuatro.dat');
    assign(entrada_emp_planta, 'Salidas/salida-ej8-emp-planta.dat');

    try
        reset(entrada_emp);
        reset(entrada_cat_cuatro);
        reset(entrada_emp_planta);
        read(entrada_emp, reg_emp);
        read(entrada_cat_cuatro, reg_cat_cuatro);
        read(entrada_emp_planta, reg_planta);

        //////////////////////////////////
        // Archivo: salida-ej8-gen.dat. //
        //////////////////////////////////
        draw_line(50, '=');
        writeln('Contenido del archivo "salida-ej8-gen.dat".');
        draw_line(50);

        while not eof(entrada_emp) do
        begin
            mostrar_empleado(reg_emp);
            draw_line(50);
            read(entrada_emp, reg_emp);
        end;

        // Me queda una línea sin mostrar al final.
        mostrar_empleado(reg_emp);

        /////////////////////////////////////////
        // Archivo: salida-ej8-cat-cuatro.dat. //
        /////////////////////////////////////////
        draw_line(50, '=');
        writeln('Contenido del archivo "salida-ej8-cat-cuatro.dat".');
        draw_line(50);

        while not eof(entrada_cat_cuatro) do
        begin
            mostrar_empleado(reg_cat_cuatro);
            draw_line(50);
            read(entrada_cat_cuatro, reg_cat_cuatro);
        end;

        // Me queda una línea sin mostrar al final.
        mostrar_empleado(reg_cat_cuatro);

        /////////////////////////////////////////
        // Archivo: salida-ej8-emp-planta.dat. //
        /////////////////////////////////////////
        draw_line(50, '=');
        writeln('Contenido del archivo "salida-ej8-emp-planta.dat".');
        draw_line(50);

        while not eof(entrada_emp_planta) do
        begin
            mostrar_planta(reg_planta);
            draw_line(50);
            read(entrada_emp_planta, reg_planta);
        end;

        // Me queda una línea sin mostrar al final.
        mostrar_planta(reg_planta);

        close(entrada_emp);
        close(entrada_cat_cuatro);
        close(entrada_emp_planta);
    except
        on E: EInOutError do
        begin
            writeln('Hubo un error al manipular uno de los archivos de entrada.');
            writeln('Tipo de error: ', E.ClassName);
            writeln('Descripción del error: "', E.Message, '"');
        end;
    end;
end.