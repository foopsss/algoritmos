{* Desarrollar un programa que calcule la suma de los números primos entre 1 y
un número n introducido por el usuario. *}

program EJ19;

var
    num_us, suma_primos, i, j: integer;
    no_primo: boolean;

begin
    suma_primos := 0;
    writeln('Este es un programa que calcula la suma de los números primos entre');
    writeln('1 y un número N introducido por el usuario. No considera 1 y N como');
    writeln('parte de la suma.');
    writeln();
    write('Introduzca un número mayor a 1: ');
    readln(num_us);

    for i := 2 to (num_us - 1) do
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
            suma_primos := suma_primos + i;
        end;
    end;

    writeln('Suma de los números primos: ', suma_primos);
end.