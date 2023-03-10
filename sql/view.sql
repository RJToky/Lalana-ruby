drop view v_prestataires cascade;

create or replace view v_prestataires as (
    select id, nom, extract(year from age(current_date, date_creation)) a, prix, vitesse v, penalite p
    from prestataires
);
