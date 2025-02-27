{* Cree una función que calcule la secuencia de Collatz para un número ingresado
por el usuario. La secuencia comienza con el número y luego se aplica la regla:
si es par, se divide entre 2; si es impar, se multiplica por 3 y se suma 1. El
proceso se repite hasta llegar a 1. *}

// NOTA: la consigna la transcribí tal cual la recibí, pero creo que lo correcto
// es hacer un procedimiento acá, y no una función. No me queda claro qué es lo
// que devolvería la función como resultado.

program EJ23;

var
    num_us: integer;

procedure collatz(num: LongInt);
begin
    if num <> 1 then
        write(num, ' -> ')
    else
        writeln(num);

    if num <> 1 then
    begin
        if num mod 2 = 0 then
            collatz(num div 2)
        else
            collatz((num * 3) + 1);
    end;
end;

begin
    write('Introduzca un número: ');
    readln(num_us);
    write('Secuencia de Collatz: ');
    collatz(num_us);
end.