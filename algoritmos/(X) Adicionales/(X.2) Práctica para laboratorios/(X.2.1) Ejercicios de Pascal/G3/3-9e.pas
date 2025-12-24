{* Este programa sirve para inspeccionar el contenido de los archivos que generé
a lo largo de este ejercicio, dado que no se tratan de texto plano y no se puede
simplemente abrirlos con un editor de texto cualquiera. El contenido se muestra
de la manera más amigable posible, con explicaciones sobre qué significa cada
cosa. *}

// Necesito esta directiva de compilador para poder usar las palabras reservadas
// "try" y "except". También voy a utilizar con este fin la librería "sysutils".
{$mode objfpc}

program EJ9;

uses
    functions in '../functions.pas',
    sysutils;

type
    vendedor = record
        dni: LongInt;
        nombre: string[100];
        prod_vend: integer;
        total: real;
    end;

    venta = record
        dni: LongInt;
        prod_vend: integer;
        total: real;
    end;

    comision = record
        dni: LongInt;
        nombre: string[100];
        com: real;
    end;

var
    mae, nmae_c, nmae_d: file of vendedor;
    mov: file of venta;
    com: file of comision;
    reg_vend: vendedor;
    reg_mov: venta;
    reg_com: comision;

procedure mostrar_vendedor(reg: vendedor);
begin
    writeln('DNI del vendedor: ', reg.dni);
    writeln('Nombre del vendedor: ', reg.nombre);
    writeln('Cantidad de productos vendidos por el vendedor: ', reg.prod_vend);
    writeln('Total recaudado por el vendedor: ', reg.total:4:2);
end;

procedure mostrar_venta(reg: venta);
begin
    writeln('DNI del vendedor: ', reg.dni);
    writeln('Cantidad de productos vendidos por el vendedor: ', reg.prod_vend);
    writeln('Total recaudado por el vendedor: ', reg.total:4:2);
end;

procedure mostrar_comision(reg: comision);
begin
    writeln('DNI del vendedor: ', reg.dni);
    writeln('Nombre del vendedor: ', reg.nombre);
    writeln('Comisión del vendedor: ', reg.com:4:2);
end;

begin
    assign(mae, 'Salidas/salida-ej9a-mae.dat');
    assign(mov, 'Salidas/salida-ej9b-mov.dat');
    assign(nmae_c, 'Salidas/salida-ej9c-mae-act.dat');
    assign(nmae_d, 'Salidas/salida-ej9d-mae-act.dat');
    assign(com, 'Salidas/salida-ej9d-com-vend.dat');

    try
        ///////////////////////////////////
        // Archivo: salida-ej9a-mae.dat. //
        ///////////////////////////////////
        reset(mae);
        read(mae, reg_vend);
        draw_line(50, '=');
        writeln('Contenido del archivo "salida-ej9a-mae.dat".');
        draw_line(50);

        while not eof(mae) do
        begin
            mostrar_vendedor(reg_vend);
            draw_line(50);
            read(mae, reg_vend);
        end;

        // Me queda una línea sin mostrar al final.
        mostrar_vendedor(reg_vend);
        close(mae);

        ///////////////////////////////////
        // Archivo: salida-ej9b-mov.dat. //
        ///////////////////////////////////
        reset(mov);
        read(mov, reg_mov);
        draw_line(50, '=');
        writeln('Contenido del archivo "salida-ej9b-mov.dat".');
        draw_line(50);

        while not eof(mov) do
        begin
            mostrar_venta(reg_mov);
            draw_line(50);
            read(mov, reg_mov);
        end;

        // Me queda una línea sin mostrar al final.
        mostrar_venta(reg_mov);
        close(mov);

        ///////////////////////////////////////
        // Archivo: salida-ej9c-mae-act.dat. //
        ///////////////////////////////////////
        reset(nmae_c);
        read(nmae_c, reg_vend);
        draw_line(50, '=');
        writeln('Contenido del archivo "salida-ej9c-mae-act.dat".');
        draw_line(50);

        while not eof(nmae_c) do
        begin
            mostrar_vendedor(reg_vend);
            draw_line(50);
            read(nmae_c, reg_vend);
        end;

        // Me queda una línea sin mostrar al final.
        mostrar_vendedor(reg_vend);
        close(nmae_c);

        ///////////////////////////////////////
        // Archivo: salida-ej9d-mae-act.dat. //
        ///////////////////////////////////////
        reset(nmae_d);
        read(nmae_d, reg_vend);
        draw_line(50, '=');
        writeln('Contenido del archivo "salida-ej9d-mae-act.dat".');
        draw_line(50);

        while not eof(nmae_d) do
        begin
            mostrar_vendedor(reg_vend);
            draw_line(50);
            read(nmae_d, reg_vend);
        end;

        // Me queda una línea sin mostrar al final.
        mostrar_vendedor(reg_vend);
        close(nmae_d);

        ////////////////////////////////////////
        // Archivo: salida-ej9d-com-vend.dat. //
        ////////////////////////////////////////
        reset(com);
        read(com, reg_com);
        draw_line(50, '=');
        writeln('Contenido del archivo "salida-ej9d-com-vend.dat".');
        draw_line(50);

        while not eof(com) do
        begin
            mostrar_comision(reg_com);
            draw_line(50);
            read(com, reg_com);
        end;

        // Me queda una línea sin mostrar al final.
        mostrar_comision(reg_com);
        close(com);
    except
        on E: EInOutError do
        begin
            writeln('Hubo un error al manipular uno de los archivos de entrada.');
            writeln('Tipo de error: ', E.ClassName);
            writeln('Descripción del error: "', E.Message, '"');
        end;
    end;
end.