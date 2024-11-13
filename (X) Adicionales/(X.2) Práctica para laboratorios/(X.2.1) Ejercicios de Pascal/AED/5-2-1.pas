program EJ521;

var
    num_us: LongInt;

procedure inverso(num: LongInt);
var
    digito: integer;
begin
    if num mod 10 = num then
        writeln(num)
    else
        begin
            digito := num mod 10;
            writeln(digito);
            inverso(num div 10);
        end;
end;

begin
    write('Introduzca un número: ');
    readln(num_us);
    writeln('Dígitos invertidos: ');
    inverso(num_us);
end.