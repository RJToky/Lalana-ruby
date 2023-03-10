# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_10_121450) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "formules", force: :cascade do |t|
    t.bigint "idlalana"
    t.string "formule"
  end

  create_table "lalanas", force: :cascade do |t|
    t.string "nom"
    t.float "largeur"
  end

  create_table "pks", force: :cascade do |t|
    t.float "valeur"
    t.bigint "idlalana"
  end

  create_table "prestataires", force: :cascade do |t|
    t.string "nom"
    t.date "date_creation"
    t.float "prix"
    t.float "vitesse"
    t.float "penalite"
  end

  create_table "simbas", force: :cascade do |t|
    t.bigint "pk_debut"
    t.bigint "pk_fin"
    t.float "niveau"
  end

  create_table "type_lalanas", force: :cascade do |t|
    t.string "nom"
    t.float "prix"
    t.float "duree"
  end

  add_foreign_key "formules", "lalanas", column: "idlalana"
  add_foreign_key "pks", "lalanas", column: "idlalana"
  add_foreign_key "simbas", "pks", column: "pk_debut"
  add_foreign_key "simbas", "pks", column: "pk_fin"

  create_view "v_prestataires", sql_definition: <<-SQL
      SELECT prestataires.id,
      prestataires.nom,
      EXTRACT(year FROM age((CURRENT_DATE)::timestamp with time zone, (prestataires.date_creation)::timestamp with time zone)) AS a,
      prestataires.prix,
      prestataires.vitesse AS v,
      prestataires.penalite AS p
     FROM prestataires;
  SQL
end
