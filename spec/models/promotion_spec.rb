require 'rails_helper'

describe Promotion do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:summary) }
  it { should ensure_length_of(:summary).is_at_most(150).with_message("Samenvatting is te lang (maximum 150 karakters)") }
  it { should validate_presence_of(:description) }
  it { should validate_numericality_of(:price) }

  it "accepts a blank price" do
    promotion = build(:promotion, price: "")

    expect(promotion.valid?).to be_truthy
  end
end
