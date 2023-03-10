class Lalana < ApplicationRecord

  def self.calc_cout_rn(idlalana, idprestataire)
    result = ActiveRecord::Base.connection.execute("
      select calc_cout_rn(#{idlalana}, #{idprestataire}) cout_total
    ")
    return result[0]
  end

  def self.calc_duree_rn(idlalana, idprestataire)
    result = ActiveRecord::Base.connection.execute("
      select calc_duree_rn(#{idlalana}, #{idprestataire}) duree_total
    ")
    return result[0]
  end

end
