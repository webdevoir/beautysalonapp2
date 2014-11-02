require 'rails_helper'

describe "A promotion" do
  it "requires a title" do
    promotion = Promotion.new(title: "", tagline: "this is a tagline", description: "this is a description")

    expect(promotion.valid?).to eq(false)
  end

  it "requires a description" do
    promotion = Promotion.new(title: "promotion1", tagline: "this is a tagline", description: "")

    expect(promotion.valid?).to eq(false)
  end
end
