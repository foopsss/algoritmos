{* Solicite al usuario una cantidad N de números enteros. Luego, cuente cuántos
de ellos son pares y cuántos son impares, mostrando los resultados al final. *}

program EJ12;

var
    num_us, i, cant_par, cant_impar: integer;
    eleccion: char;

procedure inicializar();
begin
    cant_par := 0;
    cant_impar := 0;
end;

begin
    inicializar();
    write('¿Desea ingresar un número? [S/N]: ');
    readln(eleccion);

    while eleccion = 'S' do
    begin
        write('Ingrese un número: ');
        readln(num_us);

        if num_us mod 2 = 0 then
            cant_par := cant_par + 1
        else
            cant_impar := cant_impar + 1;

        write('¿Desea ingresar otro número? [S/N]: ');
        readln(eleccion);
    end;

    writeln();
    writeln('Cantidad de números pares: ', cant_par);
    writeln('Cantidad de números impares: ', cant_impar);
end.