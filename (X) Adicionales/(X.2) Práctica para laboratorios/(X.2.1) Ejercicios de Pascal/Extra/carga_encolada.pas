program carga_encolada;

type
    puntero = ^Nodo;

    Nodo = record
        dato: char;
        prox: puntero;
    end;

var
    prim, aux, q, p: puntero;
    i: char;

begin
    prim := NIL;
    aux := NIL;

    for i := 'a' to 'd' do
    begin
        New(p);
        p^.dato := i;
        p^.prox := NIL;

        if prim = NIL then
            prim := p
        else
            aux^.prox := p;

        aux := p;
    end;

    q := prim;

    while q <> NIL do
    begin
        writeln(q^.dato);
        aux := q;
        q := q^.prox;
        Dispose(aux);
    end;

    // Entiendo que prim y p quedan apuntando a
    // direcciones de memoria que técnicamente ya
    // no existen, así que lo correcto sería liberar
    // estos punteros también.
    prim := NIL;
    p := NIL;
end.