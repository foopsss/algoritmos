{* Un banco necesita saber cuáles son las operaciones válidas luego de realizar
varias transacciones. El archivo "entrada-lab-ej2.txt" contiene registros de
transacciones, con número de transacción (termina con "#"), tipo de transacción
("D" para depósito y "R" para retiro) y un carácter que indica si la operación
ha sido válida ("S" o "N").

Se pide: ¿qué porcentaje representan las operaciones no válidas del tipo depósito
sobre el total de operaciones? *}

// Necesito esta directiva de compilador para poder usar las palabras reservadas
// "try" y "except". También voy a utilizar con este fin la librería "sysutils".
{$mode objfpc}

program EJ2;

uses
    sysutils;

var
    entrada: TextFile;
    v_ent: char;

    es_dep, no_val: boolean;
    cont_op, noval_dep: integer;
    porc_noval_dep: real;

procedure inicializar();
begin
    cont_op := 0;
    noval_dep := 0;
end;

begin
    assign(entrada, 'Materiales/entrada-lab-ej2.txt');

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

            if v_ent = 'D' then
                es_dep := true
            else
                es_dep := false;

            read(entrada, v_ent);

            if v_ent = 'N' then
                no_val := true
            else
                no_val := false;

            if (es_dep) and (no_val) then
            begin
                noval_dep := noval_dep + 1;
            end;

            read(entrada, v_ent);
        end;

        porc_noval_dep := (noval_dep * 100) / cont_op;
        writeln('Porcentaje de operaciones no válidas del tipo depósito: ', porc_noval_dep:4:2);
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