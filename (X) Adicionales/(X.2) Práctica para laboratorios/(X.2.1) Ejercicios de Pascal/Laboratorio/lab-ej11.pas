{* Escriba un programa que solicite números enteros positivos al usuario hasta
que ingrese un número negativo. Luego, muestre la suma de todos los números
ingresados. *}

program EJ11;

var
    num, suma_num: integer;

begin
    suma_num := 0;
    write('Introduzca un número: ');
    readln(num);

    while num >= 0 do
    begin
        suma_num := suma_num + num;
        write('Introduzca otro número: ');
        readln(num);
    end;

    writeln();
    writeln('La suma de los números introducidos es: ', suma_num);
end.