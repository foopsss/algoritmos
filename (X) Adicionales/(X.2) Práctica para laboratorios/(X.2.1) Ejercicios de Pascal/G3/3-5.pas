{* Se posee una secuencia con los mensajes internos enviados entre los empleados
de una empresa, la cual está formada de la siguiente manera: 3 caracteres para
el destino, 3 caracteres para el origen, 3 caracteres que indican la cantidad de
caracteres que tiene el mensaje y el mensaje. No existe ningún carácter que
separe un mensaje de otro. Se pide:

(a) Escribir una secuencia de salida con todos los mensajes (incluyendo origen y
destino) que van hacia el área de Mantenimiento (que destino comience con 1).
(b) Contar la cantidad de mensajes que se dirigen hacia el área de Sistemas (que
destino comience con 23). *}

program EJ5;

uses
    functions in '../functions.pas',
    math;

var
    entrada, salida: file of char;
    v_ent: char;

    i, cant_msg_sist, cant_car: integer;
    prim_car_dest, sec_car_dest: char;

procedure escribir_salida();
begin
    if prim_car_dest = '1' then
    begin
        write(salida, v_ent);
    end;
end;

begin
    assign(entrada, 'Materiales/entrada-ej5.txt');
    assign(salida, 'Salidas/salida-ej5.txt');

    {$I-}
    reset(entrada);
    rewrite(salida);
    {$I+}

    if IOResult <> 0 then
        error_lectura_archivo()
    else
        cant_msg_sist := 0;
        read(entrada, v_ent);

        while not eof(entrada) do
        begin
            cant_car := 0;
            prim_car_dest := v_ent;
            read(entrada, v_ent);
            sec_car_dest := v_ent;
            read(entrada, v_ent);

            if prim_car_dest = '1' then
                begin
                    write(salida, prim_car_dest);
                    write(salida, sec_car_dest);
                end
            else
                if (prim_car_dest = '2') and (sec_car_dest = '3') then
                begin
                    cant_msg_sist := cant_msg_sist + 1;
                end;

            for i := 1 to 4 do
            begin
                escribir_salida();
                read(entrada, v_ent);
            end;

            for i := 3 downto 1 do
            begin
                cant_car := cant_car + CharToInt(v_ent) * (10 ** (i - 1));
                read(entrada, v_ent);
            end;

            for i := 1 to cant_car do
            begin
                escribir_salida();
                read(entrada, v_ent);
            end;
        end;

        writeln('Número de mensajes dirigidos al área de sistemas: ', cant_msg_sist);
        close(entrada);
        close(salida);
end.