{* Crea una función que reciba un número entero y devuelva el número invertido.
Ejemplo: si el número es 123, la salida debe ser 321. *}

program EJ20;

var
    num_us: LongInt;

procedure mostrar_reves(num: LongInt);
begin
    if num mod 10 <> num then
        begin
            write(num mod 10);
            mostrar_reves(num div 10);
        end
    else
        writeln(num);
end;

begin
    write('Introduzca un número: ');
    readln(num_us);
    write('Número al revés: ');
    mostrar_reves(num_us);
end.