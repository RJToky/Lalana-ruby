create database lalana_ruby;

drop table lalanas cascade;
drop table pks cascade;
drop table simbas cascade;
drop table prestataires cascade;
drop table formules cascade;

create table lalanas (
    id serial primary key,
    nom varchar(20),
    largeur double precision
);

create table pks (
    id serial primary key,
    valeur double precision,
    idlalana bigint references lalanas(id)
);

create table simbas (
    id serial primary key,
    pk_debut bigint references pks(id),
    pk_fin bigint references pks(id),
    niveau double precision check(niveau between 0 and 100)
);

create table prestataires (
    id serial primary key,
    nom varchar(20),
    date_creation date,
    prix double precision,
    vitesse double precision,
    penalite double precision
);

create table formules (
    id serial primary key,
    idlalana bigint references lalanas(id),
    formule varchar(50)
);
