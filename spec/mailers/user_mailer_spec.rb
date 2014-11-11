require "rails_helper"

RSpec.describe UserMailer, :type => :mailer do
  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    @contact = Contact.new(name: "john doe", email: "john.doe@example.com", phone: "0498137260", message: "hi I'm John") 
    UserMailer.contact_email(@contact).deliver
  end

  after(:each) do
  ActionMailer::Base.deliveries.clear
  end

  it 'should send an email' do
    ActionMailer::Base.deliveries.count.should == 1
  end

  it 'renders the receiver email' do
    expect(ActionMailer::Base.deliveries.first.to).to have_content(Rails.application.secrets.owner_email)
  end
  
  it 'renders the sender email' do  
    expect(ActionMailer::Base.deliveries.first.from).to have_content(@contact.email)
  end

  it 'should set the subject to the correct subject' do
    expect(ActionMailer::Base.deliveries.first.subject).to have_content("Website Contact")
  end
end
