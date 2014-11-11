require 'rails_helper'

describe Contact do
  it { should validate_presence_of(:name).with_message("naam is verplicht") }
  it { should validate_presence_of(:email).with_message("email is verplicht") }
  it { should validate_presence_of(:phone).with_message("telefoonnummer is verplicht") }
  it { should validate_presence_of(:message).with_message("geef een gewenste behandeling") }
  it { should ensure_length_of(:message).is_at_most(500) }

  it "accepts properly formatted email addresses" do
    emails = %w[user@example.com john.doe@example.com]

    emails.each do |email|
      contact = Contact.new(name: "John Doe", phone: "0498137260", message: "hi from John")
      contact.email = email
      expect(contact.valid?).to be_truthy
      expect(contact.errors[:email].any?).to be_falsey
    end
  end

  it "rejects badly formatted email addresses" do
    emails = %w[@ user@ @example.com]

    emails.each do |email|
      contact = Contact.new(name: "John Doe", phone: "0498137260", message: "hi from John")
      contact.email = email
      expect(contact.valid?).to be_falsey
      expect(contact.errors[:email].any?).to be_truthy
    end
  end
end
