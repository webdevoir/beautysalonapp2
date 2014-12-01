class HomesController < ApplicationController

  def index
    @promotions = Promotion.all.where(visible: true)
    fresh_when(@promotions)
    @behandelingen = Treatment.all
    fresh_when(@behandelingen)
    @products = Product.all
    fresh_when(@products)
    @sections = Section.all.order(:position)
    fresh_when(@sections)
  end
end
