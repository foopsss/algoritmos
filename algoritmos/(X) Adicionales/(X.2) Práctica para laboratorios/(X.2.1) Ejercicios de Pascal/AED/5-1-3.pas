program EJ513;

var
    a, b, res: integer;

function potencia(base, exp: integer): integer;
begin
    if exp = 0 then
        potencia := 1
    else
        if exp = 1 then
            potencia := base
        else
            potencia := base * potencia(base, exp - 1);
            // Si se quiere ver el paso a paso del proceso, se
            // puede incluir esto.
            // writeln(potencia);
end;

begin
    write('Introduzca una base: ');
    readln(a);

    write('Introduzca un exponente: ');
    readln(b);

    res := potencia(a, b);
    writeln('El resultado de la operación es: ', res);
end.