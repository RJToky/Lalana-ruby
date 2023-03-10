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
    return rep * 1000;
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

create or replace function calc_volume_simba(_idsimba bigint)
returns double precision
language plpgsql
as $$
declare
r record;
longueur double precision;
largeur double precision;
profondeur double precision;
volume double precision;

begin
    longueur := (select (p2.valeur-p1.valeur)*1000 longueur from simbas s join pks p1 on s.pk_debut = p1.id join pks p2 on s.pk_fin = p2.id where s.id = _idsimba);
    largeur := (select l.largeur from simbas s join pks p1 on s.pk_debut = p1.id join lalanas l on l.id = p1.idlalana where s.id = _idsimba);
    profondeur := (select (s.niveau/1000) profondeur from simbas s where s.id = _idsimba);
    volume := longueur * largeur * profondeur;

    return volume;
end;
$$;

create or replace function calc_cout_rn(_idlalana bigint, _idprestataire bigint)
returns double precision
language plpgsql
as $$
declare
r record;
temp double precision;
cout double precision;

begin
    cout := 0;
    for r in (
        select s.id
        from simbas s
        join pks p on p.id = s.pk_fin
        join lalanas l on l.id = p.idlalana
        where l.id = _idlalana
    )
    loop
        temp := (select calc_volume_simba(r.id)) * (select p.prix from prestataires p where p.id = _idprestataire);
        cout := cout + temp;
    end loop;
    return cout;
end;
$$;

create or replace function calc_duree_rn(_idlalana bigint, _idprestataire bigint)
returns double precision
language plpgsql
as $$
declare
r record;
temp double precision;
duree double precision;

begin
    duree := 0;
    for r in (
        select s.id
        from simbas s
        join pks p on p.id = s.pk_fin
        join lalanas l on l.id = p.idlalana
        where l.id = _idlalana
    )
    loop
        temp := (select calc_volume_simba(r.id)) / (select p.vitesse from prestataires p where p.id = _idprestataire);
        duree := duree + temp;
    end loop;
    return duree;
end;
$$;
