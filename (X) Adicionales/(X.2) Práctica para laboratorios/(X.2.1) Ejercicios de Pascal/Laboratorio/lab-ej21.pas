{* Desarrolle una función que reciba un número y devuelva la cantidad de dígitos
que tiene. *}

program EJ21;

var
    num_us: LongInt;
    cant_dig: integer;

function numero_digitos(num: LongInt; suma: integer): integer;
begin
    if num mod 10 <> num then
        numero_digitos := numero_digitos(num DIV 10, suma + 1)
    else
        numero_digitos := suma + 1;
end;

begin
    write('Introduzca un número: ');
    readln(num_us);
    cant_dig := numero_digitos(num_us, 0);
    writeln('La cantidad de dígitos del número es: ', cant_dig);
end.