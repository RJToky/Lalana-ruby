class VPrestataire < ApplicationRecord

  def self.tri_prestataires(idlalana)
    result = ActiveRecord::Base.connection.execute("
      select *
      from tri_prestataires(#{idlalana})
      order by qualiteprix desc
    ")
    return result
  end

  def self.calc_qualite(idlalana, idprestataire)
    result = ActiveRecord::Base.connection.execute("
      select calc_qualite(#{idlalana}, #{idprestataire}) qualite
    ")
    return result[0]
  end

end
