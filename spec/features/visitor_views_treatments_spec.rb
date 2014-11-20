require 'rails_helper'

feature 'Visitor visits treatments page' do
  scenario 'visitor views treatments' do
    category1 = Category.create(name: "gelaatsverzorgingen")
    category2 = Category.create(name: "lichaamsverzorgingen")
    treatment1 = create(:treatment)
    treatment1.category = category1
    treatment1.save
    treatment2 = create(:treatment)
    treatment2.category = category2
    treatment2.save

    visit category_path(category: category1.name) 
    within(".item") { expect(page).to have_css 'h1', text: treatment1.title }
    within(".item") { expect(page).to_not have_css 'h1', text: treatment2.title }
    within(".item") { expect(page).to have_xpath("//img[contains(@src,'#{File.basename(treatment1.image.url)}')]") }
    within(".item") { expect(page).to have_css 'p', text: treatment1.summary }  

    click_link "Meer info"
    within(".behandeling") { expect(page).to have_css 'h1', text: treatment1.title }
    within(".behandeling") { expect(page).to have_xpath("//img[contains(@src,'#{File.basename(treatment1.image.url)}')]") }
    within(".content") { expect(page).to have_css 'p', text: treatment1.description }
    within(".content") { expect(page).to have_css 'p.price', text: "Prijs: #{treatment1.price}" }
  end
end
