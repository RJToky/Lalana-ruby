class CreatePrestataires < ActiveRecord::Migration[7.0]
  def change
    create_table :prestataires do |t|
      t.string :nom
      t.date :date_creation
      t.float :prix
      t.float :vitesse
      t.float :penalite
    end
  end
end
