{* Desarrolle una función que reciba un rango de números (por ejemplo, entre 10
y 50) y devuelva todos los números primos dentro de ese rango. *}

// NOTA: la consigna la transcribí tal cual la recibí, pero creo que lo correcto
// es hacer un procedimiento acá, y no una función. No me queda claro qué es lo
// que devolvería la función como resultado.

program EJ25;

var
    num_a, num_b, i, j: integer;
    no_primo: boolean;

procedure primos(a, b: integer);
begin
    write('Números primos entre A y B: ');

    for i := (num_a + 1) to (num_b - 1) do
    begin
        no_primo := false;
        for j := 2 to (i - 1) do
        begin
            if i mod j = 0 then
            begin
                no_primo := true;
                break;
            end;
        end;

        if not no_primo then
        begin
            write(i, ' ');
        end;
    end;

    // Un salto de línea para que el prompt de la consola no quede
    // pegado a la salida del programa.
    writeln();
end;

begin
    write('Introduzca un número A: ');
    readln(num_a);
    write('Introduzca un número B: ');
    readln(num_b);
    primos(num_a, num_b);
end.