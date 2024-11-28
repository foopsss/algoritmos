program EJ517;

var
    m, n, res: integer;

function MCD(dividendo, divisor: integer): integer;
begin
    // OPCIONAL: descomentar estos para poder
    // entender qué es lo que hace el programa.
    //
    // writeln(dividendo);
    // writeln(divisor);
    // writeln('-------');

    if (dividendo mod divisor) <> 0 then
        MCD := MCD(divisor, dividendo mod divisor)
    else
        MCD := divisor;
end;

begin
    write('Introduzca un número M: ');
    readln(m);

    write('Introduzca un número N: ');
    readln(n);

    res := MCD(m, n);
    writeln('El máximo común divisor de M y N es ', res, '.');
end.