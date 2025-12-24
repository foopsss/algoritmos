program EJ511;

var
    num_us, res: integer;

function factorial(n: integer): integer;
begin
    if n > 0 then
        factorial := n * factorial(n - 1)
    else
        factorial := 1;
end;

begin
    write('Ingrese un número N: ');
    readln(num_us);

    res := factorial(num_us);
    writeln('El factorial de N es: ', res);
end.