{* Tomando los archivos generados en los ejercicios anteriores (3-9a y 3-9b), se
debe generar un nuevo archivo de vendedores actualizado, actualizando la cantidad
de productos vendidos y el total recaudado por un vendedor cuando el DNI es igual.

Puede darse que un vendedor no se haya presentado a trabajar en el día que fue
generado el archivo de movimientos, en cuyo caso no hay que actualizar los campos.
En caso de encontrar un DNI que no exista en el maestro, se debe informar el error
y continuar con el próximo DNI. *}

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

const
    HV = 999999999;

var
    mae, nuevo_mae: file of vendedor;
    mov: file of venta;
    reg_mae, reg_nuevo_mae: vendedor;
    reg_mov: venta;

    resg_dni_mae, resg_dni_mov: LongInt;

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

begin
    assign(mae, 'Salidas/salida-ej9a-mae.dat');
    assign(mov, 'Salidas/salida-ej9b-mov.dat');
    assign(nuevo_mae, 'Salidas/salida-ej9c-mae-act.dat');

    try
        reset(mae);
        reset(mov);
        rewrite(nuevo_mae);
        leer_mae();
        leer_mov();

        while (reg_mae.dni <> HV) or (reg_mov.dni <> HV) do
        begin
            if reg_mae.dni < reg_mov.dni then
                begin
                    write(nuevo_mae, reg_mae);
                    leer_mae();
                end
            else
                if reg_mae.dni > reg_mov.dni then
                    begin
                        writeln('El DNI ', reg_mov.dni, ' no está registrado en el archivo de vendedores.');
                        leer_mov();
                    end
                else
                    reg_nuevo_mae := reg_mae;
                    reg_nuevo_mae.prod_vend := reg_nuevo_mae.prod_vend + reg_mov.prod_vend;
                    reg_nuevo_mae.total := reg_nuevo_mae.total + reg_mov.total;
                    write(nuevo_mae, reg_nuevo_mae);
                    leer_mae();
                    leer_mov();
        end;

        // Al igual que con el ejercicio 3.8, por algún motivo el programa lee
        // hasta el penúltimo registro de los archivos de entrada en el ciclo
        // principal, pero deja el último sin tratar, devolviendo EOF. Lo trato
        // acá.
        //
        // Debido a que estoy utilizando subacciones especiales para leer los
        // archivos por haber hecho un ciclo incluyente, cuando llego al supuesto
        // último registro de cada archivo resguardo las claves para poder usarlas
        // acá.
        //
        // No me deshago del ciclo incluyente porque entonces puedo llegar de
        // manera fácil al penúltimo registro de cada archivo para luego tratar
        // el último acá. No me queda claro cómo lo haría fácilmente con un ciclo
        // excluyente.
        //
        // Para futura referencia, creo que la explicación técnica de mi problema
        // se encuentra en estos enlaces, aunque no la entiendo bien:
        // (*) https://stackoverflow.com/a/48376806
        // (*) https://stackoverflow.com/a/48112264
        if resg_dni_mae < resg_dni_mov then
            begin
                reg_mae.dni := resg_dni_mae;
                write(nuevo_mae, reg_mae);
            end
        else
            if resg_dni_mae > resg_dni_mov then
                writeln('El DNI ', resg_dni_mov, ' no está registrado en el archivo de vendedores.')
            else
                reg_nuevo_mae := reg_mae;
                reg_nuevo_mae.dni := resg_dni_mae;
                reg_nuevo_mae.prod_vend := reg_nuevo_mae.prod_vend + reg_mov.prod_vend;
                reg_nuevo_mae.total := reg_nuevo_mae.total + reg_mov.total;
                write(nuevo_mae, reg_nuevo_mae);

        close(mae);
        close(mov);
        close(nuevo_mae);
    except
        on E: EInOutError do
        begin
            writeln('Hubo un error al manipular uno de los archivos.');
            writeln('Tipo de error: ', E.ClassName);
            writeln('Descripción del error: "', E.Message, '"');
        end;
    end;
end.