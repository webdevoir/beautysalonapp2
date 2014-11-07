require 'rails_helper'

describe "A treat" do
  it "requires a title" do
    treat = Treat.new(title: nil)

    expect(treat.valid?).to be_falsey
  end

  it "requires a summary" do
    treat = Treat.new(title: "title1", summary: nil)

    expect(treat.valid?).to be_falsey
  end

  it "requires a description" do
    treat = Treat.new(title: "title1", summary: "summary1", description: nil)

    expect(treat.valid?).to be_falsey
  end

  it "has a valid price" do
    treat = Treat.new(title: "title1", summary: "summary1", description: "description1", price: "hello")

    expect(treat.valid?).to be_falsey
  end

  it "accepts a blank price" do
    treat = Treat.new(title: "title1", summary: "summary1", description: "description1", price: "")

    expect(treat.valid?).to be_truthy
  end
end
