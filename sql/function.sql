create or replace function eval(str varchar(50))
returns double precision
language plpgsql
as $$

declare
rep double precision;

begin
    execute 'select ' || str into rep;
    return rep;
end;
$$;


create or replace function calc_qualite(_idlalana bigint, _idprestataire bigint)
returns double precision
language plpgsql
as $$

declare
rep double precision;
formule varchar(50);
begin
    formule := (select f.formule from formules f where f.idlalana = _idlalana);
    execute 'select ' || formule || ' from v_prestataires vp where vp.id = ' || _idprestataire into rep;
    return rep;
end;
$$;

create or replace function tri_prestataires(_idlalana bigint)
returns table(id bigint, nom varchar(20), prix double precision, a numeric, v double precision, p double precision, qualiteprix double precision)
language plpgsql
as $$

declare
r record;
begin
    for r in (select * from v_prestataires)
    loop
        id := r.id;
        nom := r.nom;
        prix := r.prix;
        a := r.a;
        v := r.v;
        p := r.p;
        qualiteprix := (select (calc_qualite(_idlalana, r.id)/vp.prix) qualiteprix from v_prestataires vp where vp.id = r.id);
        return next;
    end loop;
end;
$$;
