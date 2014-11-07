class Admin::TreatsController < ApplicationController
  def index
    @treats = Treat.all
  end

  def show
    @treat = Treat.find(params[:id])
  end

  def new
    @treat = Treat.new
  end

  def create
    @treat = Treat.create(treat_params)
    if @treat.save
      redirect_to admin_treats_path, notice: "Er werd een nieuwe behandeling toegevoegd"
    else
      flash[:alert] = @treat.errors.full_messages.join(' ')
      render :new
    end
  end

  def edit
    @treat = Treat.find(params[:id])
  end

  def update
    @treat = Treat.find(params[:id])
    if @treat.update_attributes(treat_params)
      redirect_to admin_treats_path, notice: "De behandeling werd aangepast"
    else
      flash.alert = @treat.errors.full_messages.join(' ')
      render :edit
    end
  end

  def destroy
    treat = Treat.find(params[:id])
    treat.destroy
    redirect_to admin_treats_path, notice: "De behandeling werd verwijderd"
  end


  private

  def treat_params
    params.required(:treat).permit(:title, :tagline, :summary, :description, :price)
  end


end
