{* Se pide realizar un juego en donde cada jugador ingresa un número entre 1
y 100. El juego consta de tres turnos donde cada jugador ingresa un número, y
el jugador que ingresa el número más grande entre los dos gana la
cantidad de puntos de (100 - el número elegido).

Al final se debe mostrar la cantidad de puntos total conseguida por cada
jugador y en base a ella determinar al ganador. *}

program EJ14;

uses
	functions;

var
	i, num_j1, num_j2: integer;
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
	// Para esta consigna, si los jugadores introducen valores
	// por fuera de los límites permitidos, saturo en el valor
	// más grande que se permite introducir, que es 100.
	//
	// De esta forma, en el cálculo posterior de puntos de cada
	// turno, el jugador que no siga las reglas no recibe nada.

	pedir_num_j1();
	if (num_j1 < 1) or (num_j1 > 100) then
	begin
		num_j1 := 100;
	end;

	pedir_num_j2();
	if (num_j2 < 1) or (num_j2 > 100) then
	begin
		num_j2 := 100;
	end;
end;

begin
	pts_j1 := 0;
	pts_j2 := 0;

	for i := 1 to 3 do
	begin
		writeln('Turno Nº: ', i);
		writeln();

		pedir_numeros();

		if num_j1 <> num_j2 then
		begin
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
				end;
		end;

		draw_line(50);
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
		end;
end.
