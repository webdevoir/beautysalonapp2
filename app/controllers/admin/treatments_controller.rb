class Admin::TreatmentsController < ApplicationController
  def index
    @treatments = Treatment.all
  end

  def show
    @treatment = Treatment.find(params[:id])
  end

  def new
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
    @treatment = Treatment.find(params[:id])
  end

  def update
    @treatment = Treatment.find(params[:id])
    if @treatment.update_attributes(treatment_params)
      redirect_to admin_treatments_path, notice: "De behandeling werd aangepast"
    else
      flash.alert = @treatment.errors.full_messages.join(' ')
      render :edit
    end
  end

  def destroy
    treatment = Treatment.find(params[:id])
    treatment.destroy
    redirect_to admin_treatments_path, notice: "De behandeling werd verwijderd"
  end


  private

  def treatment_params
    params.required(:treatment).permit(:title, :tagline, :summary, :description, :image, :price)
  end
end
