create database lalana_ruby;

drop table type_lalanas cascade;
drop table lalanas cascade;
drop table prestataires cascade;
drop table formules cascade;

create table type_lalanas (
    id serial primary key,
    nom varchar(20),
    prix double precision,
    duree double precision
);

create table lalanas (
    id serial primary key,
    nom varchar(20),
    largeur double precision,
    idtypeLalana bigint references type_lalanas(id)
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
