{* Generar un archivo con los empleados de una empresa que posea la siguiente
información: planta, categoría y nombre del empleado. *}

// NOTA: esta es la versión del ejercicio 3.8 que utiliza archivos de texto
// plano, tal y como especifiqué en la versión principal.

// Necesito esta directiva de compilador para poder usar las palabras reservadas
// "try" y "except". También voy a utilizar con este fin la librería "sysutils".
{$mode objfpc}

program EJ8_gen_ext;

uses
    sysutils;

type
    empleado = record
        planta: char;
        categoria: integer;
        nombre: string[100];
    end;

var
    salida: TextFile;
    reg_emp: empleado;

procedure cargar_empleado(VAR emp: empleado; planta: char; cat: integer; nomap: string; is_eof: boolean);
begin
    emp.planta := planta;
    writeln(salida, emp.planta);
    emp.categoria := cat;
    writeln(salida, emp.categoria);
    emp.nombre := nomap;

    if not is_eof then
        writeln(salida, emp.nombre)
    else
        write(salida, emp.nombre);
end;

begin
    assign(salida, 'Salidas/salida-ej8-gen-ext.txt');

    try
        rewrite(salida);
        cargar_empleado(reg_emp, 'A', 1, 'Aranda', false);
        cargar_empleado(reg_emp, 'A', 1, 'Vera', false);
        cargar_empleado(reg_emp, 'A', 2, 'Arce', false);
        cargar_empleado(reg_emp, 'A', 2, 'Basualdo', false);
        cargar_empleado(reg_emp, 'A', 4, 'Corrales', false);
        cargar_empleado(reg_emp, 'A', 4, 'Derqui', false);
        cargar_empleado(reg_emp, 'A', 4, 'Gutierrez', false);
        cargar_empleado(reg_emp, 'A', 4, 'Morales', false);
        cargar_empleado(reg_emp, 'B', 1, 'Biondi', false);
        cargar_empleado(reg_emp, 'B', 1, 'Casas', false);
        cargar_empleado(reg_emp, 'B', 1, 'Davis', false);
        cargar_empleado(reg_emp, 'B', 1, 'Torres', false);
        cargar_empleado(reg_emp, 'B', 2, 'Milán', false);
        cargar_empleado(reg_emp, 'B', 2, 'Molina', false);
        cargar_empleado(reg_emp, 'B', 2, 'Portales', false);
        cargar_empleado(reg_emp, 'B', 3, 'Cortez', false);
        cargar_empleado(reg_emp, 'B', 3, 'Mendez', false);
        cargar_empleado(reg_emp, 'B', 3, 'Nogueira', false);
        cargar_empleado(reg_emp, 'B', 3, 'Salerno', false);
        cargar_empleado(reg_emp, 'B', 4, 'Casas', true);
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