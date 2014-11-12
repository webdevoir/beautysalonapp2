require 'rails_helper'

feature 'Visitor visits products page' do
  scenario 'and views products' do
    product1 = create(:product)
    product2 = create(:product)
    
    visit producten_path

    expect(page).to have_css 'h1', text: product1.title
    expect(page).to have_css 'h1', text: product2.title
    expect(page).to have_css 'p', text: product1.description
    expect(page).to have_css 'p', text: product2.description
    expect(page).to have_xpath("//img[contains(@src,'#{File.basename(product1.image.url)}')]")
  end
end
