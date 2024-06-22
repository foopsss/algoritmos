unit functions;

interface
	procedure draw_line(length: integer);

implementation
	procedure draw_line(length: integer);
	var
		i: integer;
	begin
		for i := 0 to (length - 1) do
		begin
			write('-');
		end;
		writeln('-');
	end;

end.