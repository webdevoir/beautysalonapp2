class HomesController < ApplicationController

  def index
    @promotions = Promotion.all.where(visible: true)
    @behandelingen = Treatment.all
    @products = Product.all
    @sections = Section.all
  end
end
