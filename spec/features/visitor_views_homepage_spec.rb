require 'rails_helper'

feature 'Visitor visits homepage' do

  scenario 'admin views promotions' do
    promotion = create(:promotion, visible: true) 

    visit root_path
    within(".acties-inner") do
      expect(page).to have_css 'p.title', text: promotion.title
      expect(page).to have_css 'p.tagline', text: promotion.tagline
      expect(page).to have_css 'p', text: promotion.summary
      expect(page).to have_xpath("//img[contains(@src,'#{File.basename(promotion.image.url)}')]")
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
      expect(page).to_not have_css("img[src*='#{File.basename(promotion1.image.url)}']")
      expect(page).to_not have_css("img[src*='#{File.basename(promotion2.image.url)}']")
    end
  end

  scenario 'visitor clicks promotion link and sees promotion details' do
    promotion = create(:promotion, visible: true)
    visit root_path

    click_link promotion.title 

    expect(page).to have_css 'h1', text: promotion.title
    expect(page).to have_css 'p.tagline', text: promotion.tagline
    expect(page).to have_css 'p', text: promotion.description
    expect(page).to have_xpath("//img[contains(@src,'#{File.basename(promotion.image.url)}')]")
    expect(page).to have_css 'p.price', text: promotion.price
  end

  scenario 'visitor views section' do
    section = create(:section, category_id: 1)
    behandeling = create(:treatment, category_id: 1)

    visit root_path

    expect(page).to have_css 'h2', text: section.title
    expect(page).to have_xpath("//img[contains(@src,'#{File.basename(section.image.url)}')]")
    expect(page).to have_css 'p', text: section.description
    expect(page).to have_css 'a', text: behandeling.title
  end
end
