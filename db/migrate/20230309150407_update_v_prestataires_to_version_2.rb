class UpdateVPrestatairesToVersion2 < ActiveRecord::Migration[7.0]
  def change
    update_view :v_prestataires, version: 2, revert_to_version: 1
  end
end
