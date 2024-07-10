// Documentación útil para la librería:
// https://www.freepascal.org/docs-html/user/userse33.html

{$mode objfpc}
unit functions;

interface
	procedure draw_line(length: integer; symbol: char = ' ');

implementation
	procedure draw_line(length: integer; symbol: char = ' ');
	var
		i: integer;
	begin
		for i := 0 to (length - 1) do
		begin
			if symbol = ' ' then
				write('-')
			else
				write(symbol);
		end;

		if symbol = ' ' then
			writeln('-')
		else
			writeln(symbol);
	end;

end.