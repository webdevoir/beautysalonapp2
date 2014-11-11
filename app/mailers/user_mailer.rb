class UserMailer < ActionMailer::Base
  default from: "anthony.candaele@webmove.be"

  def contact_email(contact)
    @contact = contact
    mail(to: Rails.application.secrets.owner_email, from: @contact.email, :subject => "Website Contact")
  end
end
