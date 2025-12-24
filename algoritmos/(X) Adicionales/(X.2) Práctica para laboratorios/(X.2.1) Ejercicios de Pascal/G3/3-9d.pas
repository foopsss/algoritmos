{* Tomando los archivos generados en los ejercicios anteriores (3-9a y 3-9b), se
debe generar un nuevo archivo de vendedores actualizado, actualizando la cantidad
de productos vendidos y el total recaudado por un vendedor cuando el DNI es igual.

Puede darse que un vendedor no se haya presentado a trabajar en el día que fue
generado el archivo de movimientos, en cuyo caso no hay que actualizar los campos.
En caso de encontrar un DNI que no exista en el maestro, se debe pedirle al usuario
el nombre del vendedor por consola y se lo debe registrar en el maestro.

Se solicita además generar un archivo de salida que tenga el DNI, nombre y comisión
del día de cada empleado. La comisión del día es por defecto el 10% del total
recaudado, pero asciende al 20% si el vendedor vendió más de 20 productos. Por
último, se debe mostrar por pantalla cuál es el vendedor con la mayor cantidad de
productos vendidos y cuál fue el vendedor que más recaudó en el día. *}

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

    venta = record
        dni: LongInt;
        prod_vend: integer;
        total: real;
    end;

    comision = record
        dni: LongInt;
        nombre: string[100];
        comision: real;
    end;

    puntero = ^Nodo;

    Nodo = record
        nombre: string[100];
        prod_vend: integer;
        total: real;
        prox: puntero;
    end;

const
    HV = 999999999;

var
    mae, nmae: file of vendedor;
    mov: file of venta;
    com: file of comision;
    reg_mae, reg_nmae: vendedor;
    reg_mov: venta;
    reg_com: comision;

    resg_dni_mae, resg_dni_mov: LongInt;
    prim, aux, q: puntero;
    may_prod_vend: integer;
    may_total: real;
    vend_may_prod_vend, vend_may_total: string;

procedure inicializar();
begin
    prim := NIL;
    may_prod_vend := 0;
    may_total := 0;
end;

procedure leer_mae();
begin
    read(mae, reg_mae);
    if eof(mae) then
    begin
        resg_dni_mae := reg_mae.dni;
        reg_mae.dni := HV;
    end;
end;

procedure leer_mov();
begin
    read(mov, reg_mov);
    if eof(mov) then
    begin
        resg_dni_mov := reg_mov.dni;
        reg_mov.dni := HV;
    end;
end;

procedure determinar_com(dni: integer; nombre: string; prod_vend: integer; tot: real);
begin
    reg_com.dni := dni;
    reg_com.nombre := nombre;

    if prod_vend > 20 then
        reg_com.comision := tot * 0.2
    else
        reg_com.comision := tot * 0.1;

    write(com, reg_com);
end;

procedure cargar_lista(nombre: string; pr: integer; tot: real);
var
    p: puntero;
begin
    New(p);
    p^.nombre := nombre;
    p^.prod_vend := pr;
    p^.total := tot;
    p^.prox := NIL;

    if prim = NIL then
        prim := p
    else
        aux^.prox := p;

    aux := p;
end;

begin
    assign(mae, 'Salidas/salida-ej9a-mae.dat');
    assign(mov, 'Salidas/salida-ej9b-mov.dat');
    assign(nmae, 'Salidas/salida-ej9d-mae-act.dat');
    assign(com, 'Salidas/salida-ej9d-com-vend.dat');

    try
        reset(mae);
        reset(mov);
        rewrite(nmae);
        rewrite(com);
        leer_mae();
        leer_mov();
        inicializar();

        while (reg_mae.dni <> HV) or (reg_mov.dni <> HV) do
        begin
            if reg_mae.dni < reg_mov.dni then
                begin
                    write(nmae, reg_mae);
                    determinar_com(reg_mae.dni, reg_mae.nombre, reg_mae.prod_vend, reg_mae.total);
                    cargar_lista(reg_mae.nombre, reg_mae.prod_vend, reg_mae.total);
                    leer_mae();
                end
            else
                if reg_mae.dni > reg_mov.dni then
                    begin
                        writeln('El DNI ', reg_mov.dni, ' no está registrado en el archivo de vendedores.');
                        write('Introduzca el nombre del vendedor: ');
                        readln(reg_nmae.nombre);
                        reg_nmae.dni := reg_mov.dni;
                        reg_nmae.prod_vend := reg_mov.prod_vend;
                        reg_nmae.total := reg_mov.total;
                        write(nmae, reg_nmae);
                        leer_mov();
                    end
                else
                    reg_nmae := reg_mae;
                    reg_nmae.prod_vend := reg_nmae.prod_vend + reg_mov.prod_vend;
                    reg_nmae.total := reg_nmae.total + reg_mov.total;
                    write(nmae, reg_nmae);
                    leer_mae();
                    leer_mov();

                // Acá puedo registrar los datos en caso de que tenga una alta o
                // una modificación, ya que el registro reg_mae no cambia hasta
                // la próxima iteración.
                determinar_com(reg_nmae.dni, reg_nmae.nombre, reg_nmae.prod_vend, reg_nmae.total);
                cargar_lista(reg_nmae.nombre, reg_nmae.prod_vend, reg_nmae.total);
        end;

        // Explicado con mayor detalle en 3-9c.pas.
        if resg_dni_mae < resg_dni_mov then
            begin
                reg_mae.dni := resg_dni_mae;
                determinar_com(reg_mae.dni, reg_mae.nombre, reg_mae.prod_vend, reg_mae.total);
                cargar_lista(reg_mae.nombre, reg_mae.prod_vend, reg_mae.total);
                write(nmae, reg_mae);
            end
        else
            if resg_dni_mae > resg_dni_mov then
                begin
                    writeln('El DNI ', resg_dni_mov, ' no está registrado en el archivo de vendedores.');
                    write('Introduzca el nombre del vendedor: ');
                    readln(reg_nmae.nombre);
                    reg_nmae.dni := resg_dni_mov;
                    reg_nmae.prod_vend := reg_mov.prod_vend;
                    reg_nmae.total := reg_mov.total;
                    write(nmae, reg_nmae);
                end
            else
                reg_nmae := reg_mae;
                reg_nmae.dni := resg_dni_mae;
                reg_nmae.prod_vend := reg_nmae.prod_vend + reg_mov.prod_vend;
                reg_nmae.total := reg_nmae.total + reg_mov.total;
                write(nmae, reg_nmae);

            determinar_com(reg_nmae.dni, reg_nmae.nombre, reg_nmae.prod_vend, reg_nmae.total);
            cargar_lista(reg_nmae.nombre, reg_nmae.prod_vend, reg_nmae.total);

        // Vendedor con la mayor cantidad de productos vendidos
        // y vendedor con la mayor recaudación del día.
        q := prim;

        while q <> NIL do
        begin
            if may_prod_vend < q^.prod_vend then
            begin
                may_prod_vend := q^.prod_vend;
                vend_may_prod_vend := q^.nombre;
            end;

            if may_total < q^.total then
            begin
                may_total := q^.total;
                vend_may_total := q^.nombre;
            end;

            aux := q;
            q := q^.prox;
            Dispose(aux);
        end;

        writeln('El vendedor con la mayor cantidad de productos vendidos es ', vend_may_prod_vend, '.');
        writeln('El vendedor que mayor recaudó en el día es ', vend_may_total, '.');

        close(mae);
        close(mov);
        close(nmae);
        close(com);
    except
        on E: EInOutError do
        begin
            writeln('Hubo un error al manipular uno de los archivos.');
            writeln('Tipo de error: ', E.ClassName);
            writeln('Descripción del error: "', E.Message, '"');
        end;
    end;
end.