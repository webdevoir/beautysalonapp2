require 'rails_helper'

feature 'Visitor visits homepage' do

  scenario 'admin views promotions' do
    promotion = Promotion.create(title: "promotion1", tagline: "this is the tagline", description: "this is the description")

    visit root_path
    expect(page).to have_css 'p.title', text: "promotion1"
    expect(page).to have_css 'p.tagline', text: "this is the tagline"
    expect(page).to have_css 'p', text: "this is the description"
  end

  scenario 'visitor sees only promotions that have visible true' do
    promotion1 = Promotion.create(title: "promotion1", tagline: "this is tagline 1", description: "this is the description", visible: true)
    promotion2 = Promotion.create(title: "promotion2", tagline: "this is tagline 2", description: "this is description 2", visible: false)

    visit root_path

    expect(page).to have_css 'p.title', text: promotion1.title
    expect(page).not_to have_css 'p.title', text: promotion2.title
  end


end
