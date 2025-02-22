{* El usuario ingresa un número N. Si N es par, se divide entre 2. Si es impar
se multiplica por 3 y se le suma 1. Se repite este proceso hasta llegar a 1.
Ejemplo: si N = 6, la secuencia generada es: 6, 3, 10, 5, 16, 8, 4, 2 y 1. *}

program EJ15;

uses
    functions in '../functions.pas';

var
    num_us: integer;

begin
    write('Introduzca un número: ');
    readln(num_us);
    draw_line(30);

    while num_us <> 1 do
    begin
        if num_us mod 2 = 0 then
            num_us := num_us div 2
        else
            num_us := (num_us * 3) + 1;
        writeln('Número: ', num_us);
    end;
end.