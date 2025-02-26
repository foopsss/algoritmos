{* Desarrolle una función que simule una calculadora básica, donde el usuario
pueda seleccionar una operación (suma, resta, multiplicación, división) y luego
ingresar dos números para realizar la operación. El programa finaliza cuando el
usuario lo desee. *}

program EJ22;

uses
    functions in '../functions.pas';

var
    eleccion: char;

procedure suma(a, b: LongInt);
begin
    writeln('Resultado de la operación: ', a + b);
end;

procedure resta(a, b: LongInt);
begin
    writeln('Resultado de la operación: ', a - b);
end;

procedure producto(a, b: LongInt);
begin
    writeln('Resultado de la operación: ', a * b);
end;

procedure division(a, b: LongInt);
begin
    writeln('Resultado de la operación: ', a / b:4:2);
end;

procedure calculadora();
var
    op: integer;
    num_a, num_b: LongInt;
begin
    writeln('Operaciones');
    draw_line(11);
    writeln('1. Suma.');
    writeln('2. Resta.');
    writeln('3. Multiplicación.');
    writeln('4. División.');
    writeln();
    write('Introduzca la operación a realizar: ');
    readln(op);

    while (op < 1) or (op > 4) do
    begin
        write('Introduzca una de las operaciones en la lista: ');
        readln(op);
    end;

    write('Introduzca un número A: ');
    readln(num_a);
    write('Introduzca un número B: ');
    readln(num_b);

    case op of
        1: suma(num_a, num_b);
        2: resta(num_a, num_b);
        3: producto(num_a, num_b);
        4: division(num_a, num_b);
    end;
end;

begin
    write('¿Desea realizar una operación matemática? [S/N]: ');
    readln(eleccion);

    while (eleccion = 'S') or (eleccion = 's') do
    begin
        writeln();
        calculadora();
        draw_line(55, '=');
        write('¿Desea realizar otra operación matemática? [S/N]: ');
        readln(eleccion);
    end;
end.