{* Crear un sistema de inicio de sesión donde un usuario introduce su nombre
y contraseña y el sistema los compara contra unos valores previamente cargados
para verificar si son iguales o no.

Se solicita además que no se muestre el valor de la contraseña cuando se la
introduce por el teclado, y que el usuario tenga la posibilidad de introducir
la contraseña tres veces más en caso de fallar. *}

program EJ13;

uses
	CRT,
	functions in '../functions.pas';

const
	us_sist = 'user';
	pass_sist = 'pass';

var
	us_user, pass_user: string;
	car: char;
	i, j: integer;

procedure pedir_contrasenia;
begin
	write('Introduzca su contraseña: ');
	pass_user := '';

	repeat
		car := ReadKey;

		if car <> #13 then
		begin
			pass_user := pass_user + car;
			write(chr(42));
		end;
	until car = #13;
end;

procedure espacio_doble;
begin
	for i := 1 to 2 do
	begin
		writeln();
	end;
end;

begin
	write('Introduzca su usuario: ');
	readln(us_user);

	pedir_contrasenia();

	espacio_doble();

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

	if (us_user = us_sist) and (pass_user <> pass_sist) then
	begin
		for j := 1 to 3 do
		begin
			draw_line(50);
			pedir_contrasenia();
			espacio_doble();

			if pass_user = pass_sist then
			begin
				writeln('La contraseña introducida es correcta.');
				writeln('Bienvenido.');
				break;
			end;

			if pass_user <> pass_sist then
			begin
				if j < 3 then
				begin
					writeln('La contraseña introducida no es correcta.');
					writeln('Intente de nuevo.');
				end;

				if j = 3 then
				begin
					writeln('Se llegó al límite de intentos para introducir la contraseña.');
					writeln('Intente más tarde.');
				end;
			end;
		end;
	end;
end.