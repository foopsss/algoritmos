{* Calcular el IMC (Índice de Masa Corporal), que se obtiene con la fórmula
Peso / (Altura ^ 2), considerando lo siguiente:

(*) La altura (en centímetros) puede estar comprendida entre 10 cm y 240 cm.
(*) El peso puede estar comprendido entre 10 kg y 300 kg.

Realizar una subacción que tome los valores máximos de los rangos aceptables
de altura y edad y cargue el resultado del cálculo en una variable. *}

// Material para este ejercicio:
// https://wiki.freepascal.org/Basic_Pascal_Tutorial/Chapter_5/Subranges
// https://www.freepascal.org/docs-html/rtl/system/high.html

program EJ2;

uses
	math;

type
	rango_edad = 4..140;
	rango_peso = 10..300;
	rango_altura_cm = 10..240;

const
	cm_a_m = 100;

var
	edad, peso, altura_cm, imc: integer;
	altura_m: real;

procedure calcular_imc();
begin
	edad := High(rango_edad);
	peso := High(rango_peso);
	altura_cm := High(rango_altura_cm);

	altura_m := altura_cm / cm_a_m;
	imc := round(peso / (altura_m ** 2));
end;

begin
	calcular_imc();

	writeln('Su edad es: ', edad);
	writeln('Su peso es: ', peso);
	writeln('Su altura (en centímetros) es: ', altura_cm);
	writeln('Su IMC es: ', imc);
end.