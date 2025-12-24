{* Escribir un programa en pascal que dado dos números reales realice la
suma, resta, multiplicación, división entera y resto de los mismos. Tanto
X como Y deben ser ingresados por el usuario. *}

program EJ5;

var
    x, y: real;
    suma, resta, mult, div_real: real;

begin
    write('Introduzca un valor para X: ');
    readln(x);

    write('Introduzca un valor para Y: ');
    readln(y);

    suma := x + y;
    resta := x - y;
    mult := x * y;
    div_real := x / y;

    writeln();
    writeln('Valor de X: ', x:4:2);
    writeln('Valor de Y: ', y:4:2);

    writeln();
    writeln('Suma: ', suma:4:2);
    writeln('Resta: ', resta:4:2);
    writeln('Multiplicación: ', mult:4:2);
    writeln('División real: ', div_real:4:2);
end.