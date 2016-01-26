require 'rails_helper'

describe Treatment do
  it { should belong_to(:category) }
  it { should validate_presence_of(:title) } 
  it { should validate_presence_of(:summary) }
  it { should validate_length_of(:summary).is_at_most(150).with_message("Samenvatting is te lang (maximum 150 karakters)") }
  it { should validate_presence_of(:description) }
  it { should validate_numericality_of(:price) }  


  it "accepts a blank price" do
    treat = build(:treatment, price: "") 

    expect(treat.valid?).to be true
  end
end
