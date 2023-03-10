class CreateLalanas < ActiveRecord::Migration[7.0]
  def change
    create_table :lalanas do |t|
      t.string :nom
      t.float :largeur
    end
  end
end
