program EJ514;

var
    num_us: LongInt;

function tiene_impares(num: LongInt): boolean;
var
    digito: integer;
begin
    if num mod 10 = num then
        if num mod 2 <> 0 then
            tiene_impares := true
        else
            tiene_impares := false
    else
        begin
            digito := num mod 10;

            if digito mod 2 <> 0 then
                tiene_impares := true
            else
                tiene_impares := tiene_impares(num DIV 10);
        end;
end;

begin
    write('Introduzca un número: ');
    readln(num_us);

    if tiene_impares(num_us) then
    	writeln('Uno o más dígitos del número son impares.')
    else
    	writeln('Todos los dígitos del número son pares.');
end.