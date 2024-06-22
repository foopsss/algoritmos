{* Crear un sistema de inicio de sesión donde un usuario introduce su nombre
y contraseña y el sistema los compara contra unos valores previamente cargados
para verificar si son iguales o no.

Adicionalmente, se solicita que no se muestre el valor de la contraseña cuando
se la introduce por el teclado. *}

// Material para este ejercicio:
// https://www.freepascal.org/docs-html/rtl/crt/readkey.html
// https://www.freepascal.org/docs-html/rtl/system/chr.html
// https://www.freepascal.org/docs-html/rtl/keyboard/kbdscancode.html

program EJ12;

uses
	CRT;

const
	us_sist = 'user';
	pass_sist = 'pass';

var
	us_user, pass_user: string;
	car: char;
	i: integer;

begin
	write('Introduzca su usuario: ');
	readln(us_user);

	write('Introduzca su contraseña: ');
	pass_user := '';

	// #13 es el "scan code" correspondiente a la
	// tecla ENTER. Hasta que la tecla presionada
	// sea ENTER sigo recibiendo caracteres del usuario.
	repeat
		car := ReadKey;

		if car <> #13 then
		begin
			pass_user := pass_user + car;

			// chr devuelve el caracter que tenga un valor
			// ASCII especificado como parámetro. En este
			// caso, muestro por pantalla el carácter "*"
			// que tiene el valor 42.
			write(chr(42));
		end;
	until car = #13;

	for i := 1 to 2 do
	begin
		writeln();
	end;

	if (us_user = us_sist) and (pass_user = pass_sist) then
		begin
			writeln('Usuario y contraseña correctos.');
			writeln('Bienvenido.');
		end
	else
		begin
			if us_user <> us_sist then
			begin
				writeln('El usuario introducido no es correcto.');
			end;

			if pass_user <> pass_sist then
			begin
				writeln('La contraseña introducida no es correcta.');
			end;

			writeln('Intente de nuevo.');
		end;
end.