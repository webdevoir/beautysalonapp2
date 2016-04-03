class UserMailer < ActionMailer::Base
  default from: "info@anniek-lambrecht.be"

  def contact_email(contact)
    @contact = contact
    mail(to: Rails.application.secrets.owner_email, from: "info@anniek-lambrecht.be", :subject => "Website Contact")
  end
end
