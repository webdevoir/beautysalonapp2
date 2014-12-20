class ProductsController < ApplicationController
  def index
    @products = Product.order_by_position
    fresh_when(@products)
  end
end
