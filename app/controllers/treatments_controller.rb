class TreatmentsController < ApplicationController
  def index
    @category = Category.find_by_name(params[:category])
    @treatments = Treatment.all.where(category_id: @category.id)
  end

  def show
    @treatment = Treatment.friendly.find(params[:id])  
  end
end
