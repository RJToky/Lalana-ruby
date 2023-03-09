class CreateLalanas < ActiveRecord::Migration[7.0]
  def change
    create_table :lalanas do |t|
      t.string :nom
      t.float :largeur
      t.bigint :idtypelalana
    end
    add_foreign_key :lalanas, :type_lalanas, column: :idtypelalana
  end
end
