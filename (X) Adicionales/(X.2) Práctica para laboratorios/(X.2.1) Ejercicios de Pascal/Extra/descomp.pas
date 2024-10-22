program descomp;

var
    num, dig: integer;

begin
    write('Introduzca un número: ');
    readln(num);

    while num > 0 do
    begin
        dig := num mod 10;
        writeln('Dígito: ', dig);
        num := num div 10;
        writeln('Número: ', num);
    end;
end.
