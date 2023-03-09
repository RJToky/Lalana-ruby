class CreateVPrestataires < ActiveRecord::Migration[7.0]
  def change
    create_view :v_prestataires
  end
end
