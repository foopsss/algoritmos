program EJ515;

var
    a, b, res: integer;

function dividir(dividendo, divisor: integer): integer;
begin
    if dividendo > divisor then
        dividir := 1 + dividir(dividendo - divisor, divisor)
    else
        if dividendo = divisor then
            divisor := 1
        else
            dividir := 0;
end;

begin
    write('Introduzca un dividendo: ');
    readln(a);

    write('Introduzca un divisor: ');
    readln(b);

    res := dividir(a, b);
    writeln('El resultado de la operación es: ', res);
end.