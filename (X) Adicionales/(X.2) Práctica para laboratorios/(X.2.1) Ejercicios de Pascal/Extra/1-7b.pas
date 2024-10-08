{* En un colegio primario se necesita realizar un algoritmo que en vez de
colocar las notas de los alumnos en forma numérica, la misma debe ser con
una frase. El algoritmo debe traducir las notas del 0 al 10 en las
siguientes frases:

- De 0 a 3: Mal
- De 4 a 5: Insuficiente
- De 6 a 7: Bien
- De 8 a 9: Sobresaliente
- Cuando es 10: Perfecto

Para valores mayores a 10 o menores a 0 se debe evitar que el programa
salga (número fuera de rango) y se debe volver a solicitar una nota. *}

program EJ7;

uses
    functions in '../functions.pas';

var
    nota: integer;

procedure pedir_nota;
begin
    write('Introduzca la nota del alumno: ');
    readln(nota);
end;

procedure procesar_nota(ent: integer);
begin
    case ent of
        0..3: writeln('Mal.');
        4..5: writeln('Insuficiente.');
        6..7: writeln('Bien.');
        8..9: writeln('Sobresaliente.');
        10: writeln('Perfecto.');
    else
        writeln('Número fuera de rango.');
        writeln('Introduzca un número correcto.');

        draw_line(35);
        pedir_nota;
        writeln();
        procesar_nota(nota);
    end;
end;

begin
    pedir_nota;
    writeln();
    procesar_nota(nota);
end.