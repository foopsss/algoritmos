{* El Registro Civil posee datos de personas en el archivo "entrada-lab-ej3.txt"
que contiene sus nombres (pueden ser varias palabras, indeterminado, finaliza
con "&") y fechas de nacimiento (ocho caracteres, ddmmaaaaa).

Se pide: ¿qué porcentaje de personas nacieron en la primera quincena (de cualquier
mes) en el primer trimestre (de cualquier año), cuyos nombres comienzan además
con letras consonantes? *}

program EJ3;

uses
    functions in '../functions.pas';

type
    sec = TextFile;

var
    entrada: sec;
    v_ent: char;

    i, dia_nac, mes_nac: integer;
    cont_personas, quin_trim_cons: integer;
    es_consonante, es_quincena, es_trimestre: boolean;
    porc_quin_trim_cons: real;

procedure inicializar();
begin
    cont_personas := 0;
    quin_trim_cons := 0;
    dia_nac := 0;
    mes_nac := 0;
end;

begin
    assign(entrada, 'Materiales/entrada-lab-ej3.txt');

    {$I-}
    reset(entrada);
    {$I+}

    if IOResult <> 0 then
        error_lectura_archivo()
    else
        begin
            inicializar();
            read(entrada, v_ent);

            while not eof(entrada) do
            begin
                cont_personas := cont_personas + 1;

                if v_ent in ['A', 'E', 'I', 'O', 'U'] then
                    es_consonante := false
                else
                    es_consonante := true;

                while v_ent <> '&' do
                begin
                    read(entrada, v_ent);
                end;

                read(entrada, v_ent);

                // Día de nacimiento.
                dia_nac := dia_nac + CharToInt(v_ent) * 10;
                read(entrada, v_ent);
                dia_nac := dia_nac + CharToInt(v_ent);

                if dia_nac <= 15 then
                    es_quincena := true
                else
                    es_quincena := false;

                // Mes de nacimiento.
                mes_nac := mes_nac + CharToInt(v_ent) * 10;
                read(entrada, v_ent);
                mes_nac := mes_nac + CharToInt(v_ent);

                if mes_nac <= 3 then
                    es_trimestre := true
                else
                    es_trimestre := false;

                if (es_consonante) and (es_quincena) and (es_trimestre) then
                begin
                    quin_trim_cons := quin_trim_cons + 1;
                end;

                for i := 1 to 6 do
                begin
                    read(entrada, v_ent);
                end;

                dia_nac := 0;
                mes_nac := 0;
            end;

            porc_quin_trim_cons := (quin_trim_cons * 100) / cont_personas;
            writeln('Porcentaje de personas: ', porc_quin_trim_cons:4:2);
            close(entrada)
        end;
end.