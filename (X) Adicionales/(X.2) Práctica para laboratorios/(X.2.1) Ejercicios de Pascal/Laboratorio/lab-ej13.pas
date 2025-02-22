{* Pida al usuario dos números A y B y muestre todos los números primos entre
ellos. *}

program EJ13;

var
    num_a, num_b, i, j: integer;
    no_primo: boolean;

begin
    write('Introduzca un número A: ');
    readln(num_a);
    write('Introduzca un número B: ');
    readln(num_b);
    writeln();

    for i := (num_a + 1) to (num_b - 1) do
    begin
        no_primo := false;
        for j := 2 to (i - 1) do
        begin
            if i mod j = 0 then
            begin
                no_primo := true;
                break;
            end;
        end;

        if not no_primo then
        begin
            writeln('Número primo entre medio: ', i);
        end;
    end;
end.