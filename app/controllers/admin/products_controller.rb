class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to admin_products_path, notice: "Er werd een nieuw product toegevoegd"
    else
      flash[:alert] = @product.errors.full_messages.join(' ')
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])  
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to admin_products_path, notice: "Het product werd aangepast"
    else
      flash[:alert] = @product.errors.full_messages.join(' ')
      render :edit
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to admin_products_path, notice: "Het product werd verwijderd" 
  end

  private

  def product_params
    params.required(:product).permit(:title, :description)
  end
end
