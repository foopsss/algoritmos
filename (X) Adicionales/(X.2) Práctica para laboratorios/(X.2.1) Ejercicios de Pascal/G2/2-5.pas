{* Desarrollar un algoritmo de validación de número y clave de usuario teniendo
en cuenta las siguientes reglas:

(*) Todos los usuarios tienen un número de usuario fijo de cinco números y una
    contraseña numérica de longitud variable.
(*) Para validar la contraseña, se multiplica cada dígito de la contraseña por
    el número correspondiente a su posición. El primer dígito se multiplica por
    uno, el segundo por dos y así sucesivamente.
(*) Los resultados de las multiplicaciones se deben sumar y, si el total es
	mayor a los primeros dos dígitos menos significativos del usuario (los dos
	últimos dígitos del número de usuario), la contraseña es válida.

Se deben hacer las validaciones necesarias y mostrar por pantalla el mensaje
"Contraseña válida" o "Contraseña inválida", según corresponda. *}

program EJ5;

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
	ult_dos_dig_num_us, mult, suma_prod: integer;

procedure sumar_prod_digitos();
begin
	for i := digitos_pass downto 1 do
	begin
		dig_pass := pass_us div (10 ** (i - 1));
		mult := mult + 1;
		suma_prod := suma_prod + dig_pass * mult;
		pass_us := pass_us - dig_pass * (10 ** (i - 1));
	end;
end;

begin
	digitos_pass := 0;
	ult_dos_dig_num_us := 0;
	mult := 0;
	suma_prod := 0;

	write('Introduzca su número de usuario: ');
	readln(ent);
	num_us := StrToInt(ent);

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

	for i := 5 downto 1 do
	begin
		dig_num := num_us div (10 ** (i - 1));

		case i of
			2: ult_dos_dig_num_us := ult_dos_dig_num_us + dig_num * 10;
			1: ult_dos_dig_num_us := ult_dos_dig_num_us + dig_num;
		end;

		num_us := num_us - dig_num * (10 ** (i - 1));
	end;

	sumar_prod_digitos();

	if suma_prod > ult_dos_dig_num_us then
		writeln('¡Contraseña válida!')
	else
		writeln('¡Contraseña inválida!');

end.