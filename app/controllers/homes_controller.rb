class HomesController < ApplicationController

  def index
    @promotions = Promotion.all.where(visible: true)
    @behandelingen = Treatment.all.order(:position)
    @products = Product.all
    @sections = Section.all.order(:position)
  end
end
