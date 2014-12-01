class ProductsController < ApplicationController
  def index
    @products = Product.all.order(:created_at)
    fresh_when(@products)
  end
end
