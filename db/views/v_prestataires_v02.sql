select
id, nom, extract(year from age(current_date, date_creation)) a, prix, vitesse v, penalite p
from prestataires;
