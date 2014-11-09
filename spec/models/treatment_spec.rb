require 'rails_helper'

describe "A treatment" do
  it "requires a title" do
    treat = build(:treatment, title: nil) 

    expect(treat.valid?).to be_falsey
  end

  it "requires a summary" do
    treat = build(:treatment, summary: nil) 

    expect(treat.valid?).to be_falsey
  end

  it "requires a description" do
    treat = build(:treatment, description: nil) 

    expect(treat.valid?).to be_falsey
  end

  it "has a valid price" do
    treat = build(:treatment, price: "hello") 

    expect(treat.valid?).to be_falsey
  end

  it "accepts a blank price" do
    treat = build(:treatment, price: "") 

    expect(treat.valid?).to be_truthy
  end
end
