{* Escribir un programa en pascal que dado dos números enteros realice la
suma, resta, multiplicación, división entera y resto de los mismos. Tanto
X como Y deben ser ingresados por el usuario. *}

program EJ2;

var
    x, y: integer;
    suma, resta, mult, div_ent, resto: integer;

begin
    write('Introduzca un valor para X: ');
    readln(x);

    write('Introduzca un valor para Y: ');
    readln(y);

    suma := x + y;
    resta := x - y;
    mult := x * y;
    div_ent := x div y;
    resto := x mod y;

    writeln();
    writeln('Valor de X: ', x);
    writeln('Valor de Y: ', y);

    writeln();
    writeln('Suma: ', suma);
    writeln('Resta: ', resta);
    writeln('Multiplicación: ', mult);
    writeln('División entera: ', div_ent);
    writeln('Resto: ', resto);
end.