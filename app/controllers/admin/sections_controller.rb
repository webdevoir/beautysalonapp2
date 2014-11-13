class Admin::SectionsController < ApplicationController
  def index
    @sections = Section.order("position")
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.create(section_params)
    if @section.save
      redirect_to admin_sections_path, notice: "Er werd een nieuwe sectie toegevoegd"
    else
      flash[:alert] = @section.errors.full_messages.join(' ')
      render :new
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      redirect_to admin_sections_path, notice: "De sectie werd aangepast"
    else
      flash[:alert] = @section.errors.full_messages.join(' ')
      render :edit
    end
  end
  
  def destroy
    section = Section.find(params[:id])
    section.destroy
    redirect_to admin_sections_path, notice: "De sectie werd verwijderd"
  end

  def sort
    params[:section].each_with_index do |id, index|
     Section.where(id: id).update_all({position: index+1})
    end
    render nothing: true
  end

  private

  def section_params
    params.require(:section).permit(:position, :title, :description, :image, :category_id)
  end
end
