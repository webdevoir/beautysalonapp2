class Admin::SectionsController < ApplicationController
  add_breadcrumb "dashboard", :admin_path
  add_breadcrumb "secties", :admin_sections_path

  def index
    @sections = Section.all
  end

  def show
    @section = Section.find(params[:id])
    add_breadcrumb @section.title
  end

  def new
    @section = Section.new
    add_breadcrumb "sectie toevoegen" 
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
    add_breadcrumb "sectie aanpassen" 
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

  private

  def section_params
    params.require(:section).permit(:title, :description, :image, :category_id)
  end
end
