class CreateFormules < ActiveRecord::Migration[7.0]
  def change
    create_table :formules do |t|
      t.bigint :idlalana
      t.string :formule
    end
    add_foreign_key :formules, :lalanas, column: :idlalana
  end
end
