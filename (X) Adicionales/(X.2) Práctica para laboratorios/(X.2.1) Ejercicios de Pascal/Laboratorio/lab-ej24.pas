{* Desarrolle una función que reciba dos números enteros y cuente cuántos números
enteros están estrictamente entre esos dos números (sin incluir los límites). El
usuario debe poder ingresar varios números y finalizar cuando ingresa un número
negativo. *}

// NOTA: la consigna la transcribí tal cual la recibí, pero creo que lo correcto
// es hacer un procedimiento acá, y no una función. No me queda claro qué es lo
// que devolvería la función como resultado.

program EJ24;

uses
    functions in '../functions.pas';

var
    num_a, num_b: integer;

procedure enteros(a, b: integer);
var
    cont_num, i: integer;
begin
    while (num_a >= 0) and (num_b >= 0) do
    begin
        cont_num := 0;

        for i := (num_a + 1) to (num_b - 1) do
        begin
            cont_num := cont_num + 1;
        end;

        writeln('La cantidad de números enteros que se encuentran entre A y B es: ', cont_num);
        draw_line(70, '=');

        write('Introduzca otro número A: ');
        readln(num_a);
        write('Introduzca otro número B: ');
        readln(num_b);
    end;
end;

begin
    write('Introduzca un número A: ');
    readln(num_a);
    write('Introduzca un número B: ');
    readln(num_b);
    enteros(num_a, num_b);
end.