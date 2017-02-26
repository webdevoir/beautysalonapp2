class SessionsController < ApplicationController
  force_ssl unless Rails.env.development?
  def new
  
  end

  def create
    user = User.where(email: params[:email]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_path
    else
      flash.now[:alert] = "Wrong Email/Password combination"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path(protocol: 'https'), notice: "Je bent uitgelogd!"
  end
end
