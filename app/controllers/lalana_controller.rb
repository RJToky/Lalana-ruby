class LalanaController < ApplicationController

  def index
    @list_rn = Lalana.all
  end

end
