{* Un banco necesita saber cuáles son las operaciones válidas luego de realizar
varias transacciones. El archivo "entrada-lab-ej6.txt" contiene registros de
transacciones, con número de transacción (termina con "#"), tipo de transacción
("D" para depósito y "R" para retiro) y un carácter que indica si la operación
ha sido válida ("S" o "N").

Se pide: ¿qué porcentaje representan las operaciones válidas del tipo retiro
sobre el total de operaciones? *}

// Necesito esta directiva de compilador para poder usar las palabras reservadas
// "try" y "except". También voy a utilizar con este fin la librería "sysutils".
{$mode objfpc}

program EJ6;

uses
    sysutils;

var
    entrada: TextFile;
    v_ent: char;

    cont_op, val_ret: integer;
    es_ret, val: boolean;
    porc_val_ret: real;

procedure inicializar();
begin
    cont_op := 0;
    val_ret := 0;
end;

begin
    assign(entrada, 'Materiales/entrada-lab-ej6.txt');

    try
        reset(entrada);
        inicializar();
        read(entrada, v_ent);

        while not eof(entrada) do
        begin
            cont_op := cont_op + 1;

            while v_ent <> '#' do
            begin
                read(entrada, v_ent);
            end;

            // Avanzo el numeral.
            read(entrada, v_ent);

            if v_ent = 'R' then
                es_ret := true
            else
                es_ret := false;

            read(entrada, v_ent);

            if v_ent = 'S' then
                val := true
            else
                val := false;

            if (es_ret) and (val) then
            begin
                val_ret := val_ret + 1;
            end;

            read(entrada, v_ent);
        end;

        porc_val_ret := (val_ret * 100) / cont_op;
        writeln('Porcentaje de operaciones válidas del tipo retiro: ', porc_val_ret:4:2);
        close(entrada);
    except
        on E: EInOutError do
        begin
            writeln('Hubo un error al manipular el archivo.');
            writeln('Tipo de error: ', E.ClassName);
            writeln('Descripción del error: "', E.Message, '"');
        end;
    end;
end.