class CreateTypeLalanas < ActiveRecord::Migration[7.0]
  def change
    create_table :type_lalanas do |t|
      t.string :nom
      t.float :prix
      t.float :duree
    end
  end
end
