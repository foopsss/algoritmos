program EJ512;

var
    num_us, res: integer;

function fibonacci(n: integer): integer;
begin
    if n > 2 then
        fibonacci := fibonacci(n - 1) + fibonacci(n - 2)
    else
        fibonacci := 1;
end;

begin
    write('Ingrese un número N: ');
    readln(num_us);

    res := fibonacci(num_us);
    writeln('El n-ésimo número de la serie de Fibonacci es: ', res);
end.