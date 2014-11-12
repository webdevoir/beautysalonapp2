class HomesController < ApplicationController

  def index
    @promotions = Promotion.all.where(visible: true)
    @behandelingen = Treatment.all
  end
end
