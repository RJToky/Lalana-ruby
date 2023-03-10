class CreatePks < ActiveRecord::Migration[7.0]
  def change
    create_table :pks do |t|
      t.float :valeur
      t.bigint :idlalana
    end
    add_foreign_key :pks, :lalanas, column: :idlalana
  end
end
