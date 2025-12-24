{* Generar un archivo histórico de vendedores que contenga: DNI, nombre, cantidad
total de productos vendidos y monto total recaudado por cada vendedor. El archivo
debe estar ordenado por DNI. *}

// Necesito esta directiva de compilador para poder usar las palabras reservadas
// "try" y "except". También voy a utilizar con este fin la librería "sysutils".
{$mode objfpc}

program EJ9;

uses
    sysutils;

type
    vendedor = record
        dni: LongInt;
        nombre: string[100];
        prod_vend: integer;
        total: real;
    end;

var
    salida: file of vendedor;
    reg_vend: vendedor;

procedure cargar_vendedor(VAR vend: vendedor; dni: LongInt; nombre: string; cant: integer; total: real);
begin
    vend.dni := dni;
    vend.nombre := nombre;
    vend.prod_vend := cant;
    vend.total := total;
    write(salida, vend);
end;

begin
    assign(salida, 'Salidas/salida-ej9a-mae.dat');

    try
        rewrite(salida);
        cargar_vendedor(reg_vend, 10485801, 'Perez', 227, 186.57);
        cargar_vendedor(reg_vend, 15259293, 'Gutierrez', 288, 222.00);
        cargar_vendedor(reg_vend, 17435881, 'Aranda', 206, 33.74);
        cargar_vendedor(reg_vend, 17607118, 'Molina', 149, 259.23);
        cargar_vendedor(reg_vend, 18421670, 'Salerno', 66, 61.04);
        cargar_vendedor(reg_vend, 19242781, 'Mendez', 29, 162.19);
        cargar_vendedor(reg_vend, 19942300, 'Corrales', 123, 37.03);
        cargar_vendedor(reg_vend, 22793396, 'Derqui', 239, 132.28);
        cargar_vendedor(reg_vend, 26907917, 'Biondi', 224, 134.40);
        cargar_vendedor(reg_vend, 27096144, 'Nogueira', 7, 85.03);
        cargar_vendedor(reg_vend, 27638155, 'Casas', 344, 23.00);
        cargar_vendedor(reg_vend, 27685501, 'Portales', 158, 187.35);
        cargar_vendedor(reg_vend, 29919799, 'Morales', 330, 211.50);
        cargar_vendedor(reg_vend, 31776747, 'Arce', 388, 155.00);
        cargar_vendedor(reg_vend, 33056132, 'Cortez', 329, 89.93);
        cargar_vendedor(reg_vend, 34964968, 'Milan', 209, 72.52);
        cargar_vendedor(reg_vend, 37139946, 'Davis', 210, 1981.50);
        cargar_vendedor(reg_vend, 37279602, 'Dias', 104, 104.84);
        cargar_vendedor(reg_vend, 38399826, 'Vera', 319, 81.33);
        cargar_vendedor(reg_vend, 39849870, 'Basualdo', 272, 167.63);
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