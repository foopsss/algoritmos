{* Pida al usuario un número N y muestra una pirámide de números. *}

program EJ17;

var
    cant_col, num_us, i, j, num_imp: integer;

begin
    cant_col := 0;

    write('Introduzca el número de filas a imprimir: ');
    readln(num_us);
    writeln();

    for i := 1 to num_us do
    begin
        num_imp := 1;
        cant_col := cant_col + 1;

        for j := 1 to (cant_col - 1) do
        begin
            write(num_imp);
            num_imp := num_imp + 1;
        end;

        writeln(num_imp);
    end;
end.