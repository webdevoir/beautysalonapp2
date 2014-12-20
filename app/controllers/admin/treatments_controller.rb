class Admin::TreatmentsController < ApplicationController
  add_breadcrumb "dashboard", :admin_path
  add_breadcrumb "behandelingen", :admin_treatments_path
  def index
    if (category_selected?)
      @treatments = Treatment.filter_by_category(params[:treatment][:category])
      @selected = params[:treatment].try(:[], :category)
    else
      @treatments = Treatment.all.order_by_position
    end
  end

  def show
    @treatment = Treatment.friendly.find(params[:id])
    add_breadcrumb @treatment.category.name
  end

  def new
    add_breadcrumb "behandeling toevoegen"
    @treatment = Treatment.new
  end

  def create
    @treatment = Treatment.create(treatment_params)
    if @treatment.save
      redirect_to admin_treatments_path, notice: "Er werd een nieuwe behandeling toegevoegd"
    else
      flash[:alert] = @treatment.errors.full_messages.join(' ')
      render :new
    end
  end

  def edit
    add_breadcrumb "behandeling aanpassen"
    @treatment = Treatment.friendly.find(params[:id])
  end

  def update
    @treatment = Treatment.friendly.find(params[:id])
    if @treatment.update_attributes(treatment_params)
      redirect_to admin_treatments_path, notice: "De behandeling \"#{@treatment.title}\" werd aangepast"
    else
      flash.alert = @treatment.errors.full_messages.join(' ')
      render :edit
    end
  end

  def destroy
    treatment = Treatment.friendly.find(params[:id])
    treatment.destroy
    redirect_to admin_treatments_path, notice: "De behandeling werd verwijderd"
  end

  def sort
    params[:treatment].each_with_index do |id, index|
     Treatment.where(id: id).update_all({position: index+1})
    end
    render nothing: true
  end


  private

  def category_selected?
    params.has_key?(:treatment) && (params[:treatment][:category] != "")
  end

  def treatment_params
    params.required(:treatment).permit(:title, :tagline, :summary, :description, :image, :remove_image, :price, :category_id)
  end
end
