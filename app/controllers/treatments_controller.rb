class TreatmentsController < ApplicationController
  def index
    @category = Category.find_by_name(params[:category])
    @treatments = Treatment.sort_by_category(@category.id)
  end

  def show
    @treatment = Treatment.friendly.find(params[:id])  
  end
end
