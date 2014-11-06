require 'rails_helper'

describe "A user" do

  it "requires a name" do
    user = create(:user) 
    user.name = nil

    expect(user.valid?).to be_falsey
  end
  it "requires a password" do
    user = create(:user)
    user.password = nil
    
    expect(user.valid?).to be_falsey
  end

  it "rejects a password with less then 8 characters" do
    user = create(:user)
    user.password = "1234567"

    expect(user.valid?).to be_falsey
  end

  it "requires an email address" do
    user = create(:user)
    user.email = nil

    expect(user.valid?).to be_falsey
  end

  it "accepts properly formatted email addresses" do
    emails = %w[user@example.com john.doe@example.com]

    emails.each do |email|
      user = create(:user)
      user.email = email
      expect(user.valid?).to be_truthy
      expect(user.errors[:email].any?).to be_falsey
    end
  end

  it "rejects badly formatted email addresses" do
    emails = %w[@ user@ @example.com]

    emails.each do |email|
      user = create(:user)
      user.email = email
      expect(user.valid?).to be_falsey
      expect(user.errors[:email].any?).to be_truthy
    end
  end

  it "requires a unique email address" do
    user1 = create(:user)
    user2 = create(:user)

    user2.email = user1.email

    expect(user2.valid?).to be_falsey
    expect(user2.errors[:email].first).to eq("has already been taken")
  end
end
