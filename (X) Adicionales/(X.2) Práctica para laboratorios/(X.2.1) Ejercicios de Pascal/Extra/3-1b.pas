// Material para este ejercicio:
// https://www.freepascal.org/docs-html/rtl/system/random.html
// https://www.freepascal.org/docs-html/rtl/system/randomize.html

program EJ1;

uses
	functions in '../functions.pas';

type
	Libro = record
		titulo: string[100];
		autor: string[100];
		resumen: string[100];
		id_libro: LongInt;
	end;

var
	libro1, libro2, libro3: Libro;

procedure mostrar_libro(libro_ent: Libro);
begin
	writeln('Título del libro: ', libro_ent.titulo);
	writeln('Autor del libro: ', libro_ent.autor);
	writeln('Resumen del libro: ', libro_ent.resumen);
	writeln('ID del libro: ', libro_ent.id_libro);
end;

begin
	// Para cargar la ID de los libros utilizo números
	// generados al azar, estrictamente por gusto.
	Randomize;

	libro1.titulo := 'Las aventuras de Alicia en el país de las maravillas';
	libro1.autor := 'Charles Lutwidge Dodgson';
	libro1.resumen := 'Novela sobre una niña que cae por un agujero a otro mundo.';
	libro1.id_libro := random(55555);

	libro2.titulo := '1984';
	libro2.autor := 'Eric Arthur Blair';
	libro2.resumen := 'Novela de ficción distópica sobre un Estado que vigila en masa a los ciudadadanos';
	libro2.id_libro := random(55555);

	libro3.titulo := 'El diario de Ana Frank';
	libro3.autor := 'Ana Frank';
	libro3.resumen := 'Diario escrito por una joven durante la ocupación alemana de los Países Bajos.';
	libro3.id_libro := random(55555);

	mostrar_libro(libro1);
	draw_line(100);

	mostrar_libro(libro2);
	draw_line(100);

	mostrar_libro(libro3);
	draw_line(100, '=')
end.