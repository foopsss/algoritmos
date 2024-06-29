{* Calcular el IMC (Índice de Masa Corporal), que se obtiene con la fórmula
Peso / (Altura ^ 2), donde peso (en kilogramos) y altura (en centímetros)
son variables introducidas por el usuario. También se le debe solicitar su
edad.

Considérese además lo siguiente:
(*) La altura puede estar comprendida entre 10 cm y 240 cm.
(*) La edad puede estar comprendida entre 4 años y 140 años.
(*) El peso puede estar comprendido entre 10 kg y 300 kg.

Según el valor, se pueden obtener los siguientes resultados:
(*) Para las personas de 20 o más años, un IMC menor a 19 significa bajo
    peso. Entre 19 y 24 es normal, entre 25 y 29 es sobrepeso y más de 30
    implica obesidad.
(*) Para las personas menores de 20 años, un IMC menor a 14 significa bajo
    peso. Entre 14 y 19 es normal, entre 20 y 24 es sobrepeso y más de 25
    implica obesidad. *}

program EJ1;

uses
	math;

const
	cm_a_m = 100;

var
	edad, peso, altura_cm, imc: integer;
	altura_m: real;

procedure pedir_edad;
begin
	write('Introduzca su edad: ');
	readln(edad);

	while (edad < 4) or (edad > 140) do
	begin
		writeln('Ingrese una edad entre 4 y 140 años.');
		writeln();
		pedir_edad();
	end;
end;

procedure pedir_peso;
begin
	write('Introduzca su peso en kilogramos: ');
	readln(peso);

	while (peso < 10) or (peso > 300) do
	begin
		writeln('Ingrese un peso entre 10 kg y 300 kg.');
		writeln();
		pedir_peso();
	end;
end;

procedure pedir_altura;
begin
	write('Introduzca su altura en centímetros: ');
	readln(altura_cm);

	while (altura_cm < 10) or (altura_cm > 240) do
	begin
		writeln('Ingrese una altura entre 10 cm y 240 cm.');
		writeln();
		pedir_altura();
	end;
end;

begin
	pedir_edad();
	writeln();

	pedir_peso();
	writeln();

	pedir_altura();
	writeln();

	altura_m := altura_cm / cm_a_m;
	imc := round(peso / (altura_m ** 2));

	writeln('Su IMC es: ', imc);
	writeln('Su edad es: ', edad);
	writeln();

	if edad >= 20 then
		case imc of
			0..18: writeln('Usted tiene un bajo peso.');
			19..24: writeln('Usted tiene un peso normal.');
			25..29: writeln('Usted tiene sobrepeso.');
		else
			writeln('Usted tiene obesidad.');
		end
	else
		case imc of
			0..13: writeln('Usted tiene un bajo peso.');
			14..19: writeln('Usted tiene un peso normal.');
			20..24: writeln('Usted tiene sobrepeso.');
		else
			writeln('Usted tiene obesidad.');
		end;
end.