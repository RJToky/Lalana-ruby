class CreateSimbas < ActiveRecord::Migration[7.0]
  def change
    create_table :simbas do |t|
      t.bigint :pk_debut
      t.bigint :pk_fin
      t.float :niveau
    end
    add_foreign_key :simbas, :pks, column: :pk_debut
    add_foreign_key :simbas, :pks, column: :pk_fin
  end
end
