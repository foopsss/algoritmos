{* Generar un archivo con los empleados de una empresa que posea la siguiente
información: planta, categoría y nombre del empleado. *}

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

program EJ8_gen;

uses
    sysutils;

type
    empleado = record
        planta: char;
        categoria: integer;
        nombre: string[100];
    end;

var
    salida: file of empleado;
    reg_emp: empleado;

procedure cargar_empleado(VAR emp: empleado; planta: char; cat: integer; nomap: string);
begin
    emp.planta := planta;
    emp.categoria := cat;
    emp.nombre := nomap;
    write(salida, emp);
end;

begin
    assign(salida, 'Salidas/salida-ej8-gen.dat');

    try
        rewrite(salida);
        cargar_empleado(reg_emp, 'A', 1, 'Aranda');
        cargar_empleado(reg_emp, 'A', 1, 'Vera');
        cargar_empleado(reg_emp, 'A', 2, 'Arce');
        cargar_empleado(reg_emp, 'A', 2, 'Basualdo');
        cargar_empleado(reg_emp, 'A', 4, 'Corrales');
        cargar_empleado(reg_emp, 'A', 4, 'Derqui');
        cargar_empleado(reg_emp, 'A', 4, 'Gutierrez');
        cargar_empleado(reg_emp, 'A', 4, 'Morales');
        cargar_empleado(reg_emp, 'B', 1, 'Biondi');
        cargar_empleado(reg_emp, 'B', 1, 'Casas');
        cargar_empleado(reg_emp, 'B', 1, 'Davis');
        cargar_empleado(reg_emp, 'B', 1, 'Torres');
        cargar_empleado(reg_emp, 'B', 2, 'Milán');
        cargar_empleado(reg_emp, 'B', 2, 'Molina');
        cargar_empleado(reg_emp, 'B', 2, 'Portales');
        cargar_empleado(reg_emp, 'B', 3, 'Cortez');
        cargar_empleado(reg_emp, 'B', 3, 'Mendez');
        cargar_empleado(reg_emp, 'B', 3, 'Nogueira');
        cargar_empleado(reg_emp, 'B', 3, 'Salerno');
        cargar_empleado(reg_emp, 'B', 4, 'Casas');
        close(salida);
    except
        on E: EInOutError do
        begin
            writeln('Hubo un error al manipular el archivo de salida.');
            writeln('Tipo de error: ', E.ClassName);
            writeln('Descripción del error: "', E.Message, '"');
        end;
    end;
end.