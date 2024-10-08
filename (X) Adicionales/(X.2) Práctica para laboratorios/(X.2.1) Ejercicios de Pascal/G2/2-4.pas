{* Desarrollar un algoritmo de validación de número y clave de usuario teniendo
en cuenta las siguientes reglas:

(*) Todos los usuarios tienen un número de usuario fijo de cinco números y una
    contraseña numérica de longitud variable.
(*) Para validar la contraseña, se toma el primer dígito del número de usuario
    y, si es par, se multiplica cada uno de los dígitos de la contraseña por
    dos. Si es impar, se multiplica cada uno de los dígitos por tres.
(*) Los resultados de las multiplicaciones se deben sumar y, si el total es
	mayor a los primeros dos dígitos menos significativos del usuario (los dos
	últimos dígitos del número de usuario), la contraseña es válida.

Se deben hacer las validaciones necesarias y mostrar por pantalla el mensaje
"Contraseña válida" o "Contraseña inválida", según corresponda. *}

// Material para este ejercicio:
// https://www.freepascal.org/docs-html/rtl/sysutils/strtoint.html

program EJ4;

uses
    CRT,
    math,
    sysutils;

var
    ent: string[5];
    ent2: string;
    car: char;

    num_us, pass_us: LongInt;
    i, digitos_pass, dig_num, dig_pass: integer;
    prim_dig_num_us, ult_dos_dig_num_us, suma_prod: integer;

procedure sumar_prod_digitos(mult: integer);
begin
    for i := digitos_pass downto 1 do
    begin
        dig_pass := pass_us div (10 ** (i - 1));
        suma_prod := suma_prod + dig_pass * mult;
        pass_us := pass_us - dig_pass * (10 ** (i - 1));
    end;
end;

begin
    digitos_pass := 0;
    ult_dos_dig_num_us := 0;
    suma_prod := 0;

    // Me aseguro de que el número de usuario
    // tiene solo 5 dígitos leyéndolo como un
    // string y convirtiéndolo luego.
    write('Introduzca su número de usuario: ');
    readln(ent);
    num_us := StrToInt(ent);

    // También leo la contraseña como un string
    // para ir contando la cantidad de caracteres
    // introducidos.
    write('Introduzca su clave: ');
    ent2 := '';

    repeat
        car := ReadKey;

        if car <> #13 then
        begin
            ent2 := ent2 + car;
            digitos_pass := digitos_pass + 1;
            write(car);
        end;
    until car = #13;

    pass_us := StrToInt(ent2);

    for i := 1 to 2 do
    begin
        writeln();
    end;

    // Obtengo los dígitos relevantes del número
    // de usuario y multiplico los caracteres de
    // la contraseña.
    for i := 5 downto 1 do
    begin
        dig_num := num_us div (10 ** (i - 1));

        case i of
            5: prim_dig_num_us := dig_num;
            2: ult_dos_dig_num_us := ult_dos_dig_num_us + dig_num * 10;
            1: ult_dos_dig_num_us := ult_dos_dig_num_us + dig_num;
        end;

        num_us := num_us - dig_num * (10 ** (i - 1));
    end;

    if prim_dig_num_us mod 2 = 0 then
        sumar_prod_digitos(2)
    else
        sumar_prod_digitos(3);

    if suma_prod > ult_dos_dig_num_us then
        writeln('¡Contraseña válida!')
    else
        writeln('¡Contraseña inválida!');
end.