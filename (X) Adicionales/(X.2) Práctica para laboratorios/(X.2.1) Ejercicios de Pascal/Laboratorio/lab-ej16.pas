{* Un número de Armstrong (o narcisista) es aquel cuya suma de sus dígitos
elevados a la cantidad de cifras es igual al número. Ejemplos:

(*) 153 → 1³ + 5³ + 3³ = 153 → Sí es.
(*) 9474 → 9⁴ + 4⁴ + 7⁴ + 4⁴ = 9474 → Sí es.
(*) 125 → 1³ + 2³ + 5³ = 134 → No es. *}

program EJ16;

uses
    math;

var
    num_us, suma_dig: LongInt;
    cant_dig: integer;

function numero_digitos(num: LongInt; suma: integer): integer;
begin
    if num mod 10 <> num then
        numero_digitos := numero_digitos(num DIV 10, suma + 1)
    else
        numero_digitos := suma + 1;
end;

function sumar_potencias(num: LongInt; suma: integer; num_dig: integer): LongInt;
begin
    if num mod 10 <> num then
        sumar_potencias := sumar_potencias(num div 10, suma + (num mod 10) ** num_dig, num_dig)
    else
        sumar_potencias := suma + (num ** num_dig);
end;

begin
    write('Introduzca un número: ');
    readln(num_us);
    cant_dig := numero_digitos(num_us, 0);
    suma_dig := sumar_potencias(num_us, 0, cant_dig);
    writeln('La suma de los dígitos elevados a la cantidad de dígitos es: ', suma_dig);
end.