{* Se tiene un archivo con los empleados de una empresa que posee los siguientes
campos: planta, categoría y nombre del empleado. La categoría es un número entero
que va del uno al cuatro.

Se pide mostrar el nombre de cada trabajador y la cantidad de trabajadores que
hay por categoría, planta y total general. *}

// NOTA: en este ejercicio 3.8, opté por trabajar con archivos binarios en vez de
// archivos de texto plano solo porque esto se asemeja un poco más a lo que vimos
// en clases y es más fácil de crear y leer, aunque realmente prefiero más el
// texto plano porque se puede inspeccionar sin necesidad de crear un programa
// con ese fin.
//
// De todas formas, junto con este ejercicio viene un programa (3-8c.pas) para
// visualizar la información de todos los archivos generados, y voy a incluir en
// la carpeta "Extra" una versión parcial de esta consigna que utilice archivos
// de texto plano para demostrar que también es feasible.

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

var
    entrada: file of empleado;
    reg_emp: empleado;

    resg_planta: char;
    resg_categoria, tot_emp_planta, tot_emp_categoria, tot_gen: integer;

procedure inicializar();
begin
    resg_categoria := reg_emp.categoria;
    resg_planta := reg_emp.planta;
    tot_emp_categoria := 0;
    tot_emp_planta := 0;
    tot_gen := 0;
end;

procedure corte_categoria();
begin
    writeln('Planta: ', resg_planta);
    writeln('Categoría: ', resg_categoria);
    writeln('Total de trabajadores en la categoria: ', tot_emp_categoria);
    tot_emp_planta := tot_emp_planta + tot_emp_categoria;
    tot_emp_categoria := 0;
    resg_categoria := reg_emp.categoria;
end;

procedure corte_planta();
begin
    corte_categoria();
    writeln('Planta: ', resg_planta);
    writeln('Total de trabajadores en la planta: ', tot_emp_planta);
    tot_gen := tot_gen + tot_emp_planta;
    tot_emp_planta := 0;
    resg_planta := reg_emp.planta;
    draw_line(50, '=');
end;

begin
    assign(entrada, 'Salidas/salida-ej8-gen.dat');

    try
        reset(entrada);
        read(entrada, reg_emp);
        inicializar();

        while not eof(entrada) do
        begin
            writeln('Nombre del empleado: ', reg_emp.nombre);
            if resg_planta <> reg_emp.planta then
                corte_planta()
            else
                if resg_categoria <> reg_emp.categoria then
                    corte_categoria();

            tot_emp_categoria := tot_emp_categoria + 1;
            read(entrada, reg_emp);
        end;

        corte_planta();
        writeln('Nombre del empleado: ', reg_emp.nombre);
        writeln('Total general de empleados: ', tot_gen);
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