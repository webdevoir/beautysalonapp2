require 'rails_helper'

describe "A promotion" do
  it "requires a title" do
    promotion = build(:promotion, title: "") 

    expect(promotion.valid?).to eq(false)
  end

  it "requires a description" do
    promotion = build(:promotion, description: nil) 

    expect(promotion.valid?).to eq(false)
  end

  it "has a valid price" do
    promotion = build(:promotion, price: "hello")

    expect(promotion.valid?).to eq(false)
  end

  it "accepts a blank price" do
    promotion = build(:promotion, price: "")

    expect(promotion.valid?).to eq(true)
  end
end
