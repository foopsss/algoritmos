{* Generar un archivo que posea las ventas realizadas por los vendedores en el
día, de los cuales se necesita los siguientes campos: DNI del vendedor, cantidad
de productos vendidos y total recaudado.

El archivo tiene que estar ordenado por la clave, la cual es el DNI, y solo
pueden existir uno o ningún movimiento por cada vendedor. *}

// Necesito esta directiva de compilador para poder usar las palabras reservadas
// "try" y "except". También voy a utilizar con este fin la librería "sysutils".
{$mode objfpc}

program EJ9;

uses
    sysutils;

type
    venta = record
        dni: LongInt;
        prod_vend: integer;
        total: real;
    end;

var
    salida: file of venta;
    reg_venta: venta;

procedure cargar_venta(VAR dato_venta: venta; dni: LongInt; cant: integer; total: real);
begin
    dato_venta.dni := dni;
    dato_venta.prod_vend := cant;
    dato_venta.total := total;
    write(salida, dato_venta);
end;

begin
    assign(salida, 'Salidas/salida-ej9b-mov.dat');

    try
        rewrite(salida);
        cargar_venta(reg_venta, 10485801, 81, 59.33);
        cargar_venta(reg_venta, 17435881, 39, 86.50);
        cargar_venta(reg_venta, 18421670, 84, 7.67);
        cargar_venta(reg_venta, 19242781, 54, 11.88);
        cargar_venta(reg_venta, 19942300, 76, 46.00);
        cargar_venta(reg_venta, 26907917, 79, 183.00);
        cargar_venta(reg_venta, 27096144, 37, 28.00);
        cargar_venta(reg_venta, 27638155, 48, 11.60);
        cargar_venta(reg_venta, 27685501, 62, 24.57);
        cargar_venta(reg_venta, 29819799, 27, 2.60);
        cargar_venta(reg_venta, 31776747, 88, 18.14);
        cargar_venta(reg_venta, 33056132, 81, 21.00);
        cargar_venta(reg_venta, 35964968, 15, 27.25);
        cargar_venta(reg_venta, 37139946, 46, 8.13);
        cargar_venta(reg_venta, 37279602, 25, 9.33);
        cargar_venta(reg_venta, 38399826, 66, 18.60);
        cargar_venta(reg_venta, 39849870, 46, 31.67);
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