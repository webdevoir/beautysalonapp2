class TreatmentsController < ApplicationController
  def index
    @category = Category.friendly.find(params[:category_id])
    @treatments = Treatment.all.where(category_id: params[:category_id])
  end

  def show
    @treatment = Treatment.friendly.find(params[:id])  
  end
end
