{* Se pide realizar un juego en donde cada jugador ingresa un número entre 1
y 100. El juego consta de tres turnos donde cada jugador ingresa un número, y
el jugador que ingresa el número más grande entre los dos gana la
cantidad de puntos de (100 - el número elegido).

Considérese además lo siguiente:

(*) Se debe permitir el empate en cada iteración y en el final del juego.
(*) Se debe permitir que la cantidad de turnos sea introducida por
    el teclado.
(*) Cuando un jugador ingrese un número fuera de rango, se le debe informar
    por pantalla y permitir que vuelva a introducir un número.

Al final se debe mostrar la cantidad de puntos total conseguida por cada
jugador y en base a ella determinar al ganador. *}

program EJ15;

uses
	functions;

var
	i, turnos, num_j1, num_j2: integer;
	pts_turno_j1, pts_turno_j2: integer;
	pts_j1, pts_j2: integer;

procedure pedir_num_j1;
begin
	write('Número del jugador 1: ');
	readln(num_j1);
end;

procedure pedir_num_j2;
begin
	write('Número del jugador 2: ');
	readln(num_j2);
end;

procedure pedir_numeros;
begin
	pedir_num_j1();
	if (num_j1 < 1) or (num_j1 > 100) then
	begin
		writeln('Ingrese un número entre 1 y 100.');
		writeln();
		pedir_num_j1();
	end;

	writeln();

	pedir_num_j2();
	if (num_j2 < 1) or (num_j2 > 100) then
	begin
		writeln('Ingrese un número entre 1 y 100.');
		writeln();
		pedir_num_j2();
	end;
end;

begin
	pts_j1 := 0;
	pts_j2 := 0;

	write('Número de turnos a jugarse: ');
	readln(turnos);

	for i := 1 to turnos do
	begin
		draw_line(50);

		writeln('Turno Nº: ', i);
		writeln();

		pedir_numeros();

		writeln();
		if num_j1 > num_j2 then
			begin
				pts_turno_j1 := 100 - num_j1;
				pts_j1 := pts_j1 + pts_turno_j1;
				writeln('El ganador de este turno es el jugador 1.');
				writeln('Obtuvo ', pts_turno_j1, ' puntos.');
			end
		else
			if num_j1 < num_j2 then
				begin
					pts_turno_j2 := 100 - num_j2;
					pts_j2 := pts_j2 + pts_turno_j2;
					writeln('El ganador de este turno es el jugador 2.');
					writeln('Obtuvo ', pts_turno_j2, ' puntos.');
				end
			else
				begin
					pts_turno_j1 := 0;
					pts_turno_j2 := 0;
					writeln('¡Empate!');
					writeln('Ningún jugador obtuvo puntos en este turno.');
				end;

		if i = turnos then
		begin
			draw_line(50);
		end;
	end;

	if pts_j1 > pts_j2 then
		begin
			writeln('El ganador es el jugador 1.');
			writeln('Obtuvo un total de ', pts_j1, ' puntos.');
		end
	else
		if pts_j1 < pts_j2 then
			begin
				writeln('El ganador es el jugador 2.');
				writeln('Obtuvo un total de ', pts_j2, ' puntos.');
			end
		else
			begin
				writeln('¡Empate!');
				writeln('Ambos jugadores obtuvieron un total de ', pts_j1, ' puntos.');
			end;
end.
