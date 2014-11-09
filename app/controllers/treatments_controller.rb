class TreatmentsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @treatments = Treatment.all.where(category_id: params[:category_id])
  end

  def show
    @treatment = Treatment.find(params[:id])  
  end
end
