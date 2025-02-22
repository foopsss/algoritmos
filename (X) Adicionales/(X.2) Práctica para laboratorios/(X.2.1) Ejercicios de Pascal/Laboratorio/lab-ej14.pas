{* Pida al usuario un número entero positivo y calcula la suma de sus dígitos.
Por ejemplo: si el usuario ingresa 345, la salida debe ser 3 + 4 + 5 = 12. *}

program EJ14;

var
    num_us, suma_dig: integer;

function sumar_digitos(num: integer; suma: integer): integer;
begin
    if num mod 10 <> num then
        sumar_digitos := sumar_digitos(num DIV 10, suma + num MOD 10)
    else
        sumar_digitos := suma + num;
end;

begin
    write('Introduzca un número: ');
    readln(num_us);
    suma_dig := sumar_digitos(num_us, 0);
    writeln('La suma de los dígitos del número introducido es: ', suma_dig);
end.