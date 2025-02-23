{* Desarrollar un programa donde el usuario deba adivinar un número entre 1 y
100 y el programa le indique si el número es mayor o menor hasta que el usuario
lo adivine. *}

program EJ18;

var
    num_comp, num_us: integer;

begin
    Randomize;
    num_comp := random(100);
    write('Adiviná el número en el que está pensando la computadora: ');
    readln(num_us);

    while num_us <> num_comp do
    begin
        if num_us > num_comp then
            writeln('Probá con un número un poco más chico.')
        else
            if num_us < num_comp then
                writeln('Probá con un número un poco más grande.');

        write('Intentá adivinar de nuevo: ');
        readln(num_us);
    end;

    writeln();
    writeln('¡Felicidades, adivinaste el número!');
    writeln('La computadora estaba pensando en el número ', num_comp, '.');
end.