class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      UserMailer.contact_email(@contact).deliver
    else
      flash[:alert] = @contact.errors.full_messages.join(' ')
      render :new
    end
  end


  private

  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :message)
  end
end
