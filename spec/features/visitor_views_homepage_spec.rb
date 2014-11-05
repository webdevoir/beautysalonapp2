require 'rails_helper'

feature 'Visitor visits homepage' do

  scenario 'admin views promotions' do
    promotion = create(:promotion, visible: true) 

    visit root_path
    within(".acties-inner") do
      expect(page).to have_css 'p.title', text: promotion.title
      expect(page).to have_css 'p.tagline', text: promotion.tagline
      expect(page).to have_css 'p', text: promotion.description
      expect(page).to have_xpath("//img[@src='/Users/acandael/Sites/beautysalonapp2/spec/support/uploads/promotion/image/#{promotion.id}/#{File.basename(promotion.image.url)}']")
    end
  end

  scenario 'visitor sees only promotions that have visible true' do
    promotion1 = create(:promotion, visible: true) 
    promotion2 = create(:promotion, visible: false) 

    visit root_path

    expect(page).to have_css 'p.title', text: promotion1.title
    expect(page).not_to have_css 'p.title', text: promotion2.title
  end

  scenario 'visitor sees no images when more then 1 promotion' do
    promotion1 = create(:promotion, visible: true) 
    promotion2 = create(:promotion, visible: true) 

    visit root_path

    within(".acties-inner") do
      expect(page).not_to have_xpath("//img[@src='/Users/acandael/Sites/beautysalonapp2/spec/support/uploads/promotion/image/#{promotion1.id}/#{File.basename(promotion1.image.url)}']")
 
      expect(page).not_to have_xpath("//img[@src='/Users/acandael/Sites/beautysalonapp2/spec/support/uploads/promotion/image/#{promotion2.id}/#{File.basename(promotion2.image.url)}']")
    end
  end

  scenario 'visitor clicks promotion link and sees promotion details' do
    promotion = create(:promotion, visible: true)
    visit root_path

    click_link promotion.title 

    expect(page).to have_css 'h1', text: promotion.title
    expect(page).to have_css 'p.tagline', text: promotion.tagline
    expect(page).to have_css 'p', text: promotion.description
    expect(page).to have_xpath("//img[@src='/Users/acandael/Sites/beautysalonapp2/spec/support/uploads/promotion/image/#{promotion.id}/#{File.basename(promotion.image.url)}']")
    expect(page).to have_css 'p.price', text: promotion.price
  end
end
