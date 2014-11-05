class HomesController < ApplicationController

  def index
    @promotions = Promotion.all.where(visible: true)
  end
end
