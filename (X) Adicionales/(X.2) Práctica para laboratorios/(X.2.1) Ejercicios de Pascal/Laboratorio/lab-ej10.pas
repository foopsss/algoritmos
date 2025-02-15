{* Crear un programa que imprima la figura de un triángulo rectángulo utilizando
una serie de filas de asteriscos, donde la cantidad de filas debe ser ingresada
por el usuario y debe ser mayor o igual a uno. *}

program EJ10;

var
    cant_filas, cant_ast, i, j: integer;

procedure pedir_cantidad();
begin
    write('Introduzca el número de filas de asteriscos a imprimir: ');
    readln(cant_filas);

    if cant_filas < 1 then
    begin
        pedir_cantidad();
    end;
end;

begin
    cant_ast := 1;
    pedir_cantidad();

    for i := 1 to cant_filas do
    begin
        for j := 1 to (cant_ast - 1) do
        begin
            write('*');
        end;
        writeln('*');
        cant_ast := cant_ast + 1;
    end;
end.