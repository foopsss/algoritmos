{* Escribir un programa en pascal que dado dos números enteros realice la
suma, resta, multiplicación, división entera y resto de los mismos. El
usuario debe introducir la operación a realizar. *}

program EJ3;

var
    eleccion, x, y: integer;
    suma, resta, mult, div_ent, resto: integer;

procedure op_suma();
begin
    suma := x + y;
    writeln('Resultado de la suma: ', suma);
end;

procedure op_resta();
begin
    resta := x - y;
    writeln('Resultado de la resta: ', resta);
end;

procedure op_producto();
begin
    mult := x * y;
    writeln('Resultado de la multiplicación: ', mult);
end;

procedure op_divent();
begin
    div_ent := x div y;
    writeln('Resultado de la división entera: ', div_ent);
end;

procedure op_resto();
begin
    resto := x mod y;
    writeln('Resultado del resto: ', resto);
end;

begin
    writeln('Operaciones');
    writeln('-----------');
    writeln('1. Suma');
    writeln('2. Resta');
    writeln('3. Multiplicación');
    writeln('4. División entera');
    writeln('5. Resto');

    writeln();
    write('Introduzca su elección: ');
    readln(eleccion);
    write('Introduzca un valor para X: ');
    readln(x);
    write('Introduzca un valor para Y: ');
    readln(y);

    writeln();
    case eleccion of
        1: op_suma();
        2: op_resta();
        3: op_producto();
        4: op_divent();
        5: op_resto();
    end;
end.