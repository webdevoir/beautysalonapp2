class Admin::PromotionsController < ApplicationController
  def index
    @promotions = Promotion.all
  end

  def show
    @promotion = Promotion.find(params[:id])
  end

  def new
    @promotion = Promotion.new
  end

  def create
    @promotion = Promotion.create(promotion_params)
    if @promotion.save
      redirect_to admin_promotions_path, notice: "Er werd een nieuwe actie toegevoegd"
    else
      flash[:alert] = @promotion.errors.full_messages.join(' ')
      render :new
    end
  end

  def edit
    @promotion = Promotion.find(params[:id])
  end

  def update
    @promotion = Promotion.find(params[:id])
    if @promotion.update_attributes(promotion_params)
      redirect_to admin_promotions_path, notice: "De actie werd aangepast"
    else
      flash.alert = @promotion.errors.full_messages.join(' ')
      render :edit
    end
  end

  def destroy
    promotion = Promotion.find(params[:id])
    promotion.destroy
    redirect_to admin_promotions_path, notice: "De actie werd verwijderd"
  end

  def hide
    @promotion = Promotion.find(params[:id])
    @promotion.toggle_visibility!
    render "hide.js.erb"
  end
  

  private

  def promotion_params
    params.required(:promotion).permit(:title, :tagline, :description, :image)
  end
end
