class VPrestataire < ApplicationRecord

  def self.tri_prestataires(idlalana)
    result = ActiveRecord::Base.connection.execute("
      select *
      from tri_prestataires(#{idlalana})
      order by qualiteprix desc
    ")
    return result
  end

end
