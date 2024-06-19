{* Crear un sistema de inicio de sesión donde un usuario introduce su nombre
y contraseña y el sistema los compara contra unos valores previamente cargados
para verificar si son iguales o no. *}

program EJ11;

const
	us_sist = 'user';
	pass_sist = 'pass';

var
	us_user, pass_user: string;

begin
	write('Introduzca su usuario: ');
	readln(us_user);

	write('Introduzca su contraseña: ');
	readln(pass_user);

	writeln();
	if (us_user = us_sist) and (pass_user = pass_sist) then
		begin
			writeln('Usuario y contraseña correctos.');
			writeln('Bienvenido.');
		end
	else
		begin
			writeln('El usuario y/o contraseña introducidos no son correctos.');
			writeln('Intente de nuevo.');
		end;
end.