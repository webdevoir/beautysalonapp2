require 'rails_helper'

feature 'Admin interacts with treatments' do
  let!(:treatment) { create(:treatment) }
  before do
    visit admin_treatments_path
  end
  scenario 'admin views treatments' do
    expect(page).to have_css 'td', text: treatment.title
  end

  scenario 'admin sees message when no treats available' do
    Treatment.destroy(treatment)
    visit admin_treatments_path

    expect(page).to have_css 'p', text: 'Er zijn momenteel geen behandelingen, voeg een nieuwe behandeling toe'
  end

  scenario 'admin clicks on treatment title and sees treatment details' do
    category = Category.create(name: "gelaatsverzorgingen")
    treatment.category_id = category.id
    treatment.save
    click_link treatment.title

    expect(page).to have_css 'h1', text: treatment.title
    expect(page).to have_css 'p', text: treatment.tagline
    expect(page).to have_css 'p', text: treatment.summary
    expect(page).to have_css 'p', text: treatment.description
    expect(page).to have_css 'p', text: treatment.price
  end

  scenario 'admin sees success message when adding a valid treat' do
    Category.create(name: "gelaatsverzorgingen")
    Category.create(name: "lichaamsbehandelingen")

    find("input[@value='Behandeling Toevoegen']").click
    select "gelaatsverzorgingen", from: "Category"
    fill_in 'Titel', with: "some title"
    fill_in 'Tagline', with: "some tagline"
    fill_in 'Samenvatting', with: "some summary"
    fill_in 'Beschrijving', with: "some description"
    fill_in 'Prijs', with: 40.23
    click_button 'Behandeling Toevoegen'

    expect(page).to have_css 'p', text: "Er werd een nieuwe behandeling toegevoegd"
    expect(page).to have_css 'a', text: "some title"
  end

  scenario 'admin sees error message when adding an invalid treat' do
    find("input[@value='Behandeling Toevoegen']").click
    fill_in 'Titel', with: ""
    fill_in 'Tagline', with: "some tagline"
    fill_in 'Samenvatting', with: "some summary"
    fill_in 'Beschrijving', with: "some description"
    fill_in 'Prijs', with: 40.23
    click_button 'Behandeling Toevoegen'

    expect(page).to have_css 'p', text: "Title can't be blank"
  end

  scenario 'admin sees success message when editing a treatment' do
    find("a[href='/admin/treatments/#{(treatment.title).parameterize}/edit']").click
    find("input[@id='treatment_title']").set("new title")
    find("input[@id='treatment_tagline']").set("new tagline")
    find("textarea[@id='treatment_summary']").set("new summary")
    find("textarea[@id='treatment_description']").set("new description")
    find("input[@id='treatment_price']").set(40.23)
    click_button "Behandeling Aanpassen"

    expect(page).to have_content "De behandeling werd aangepast"
    expect(page).to have_css 'a', text: "new title"
  end

  scenario 'admin sees error message when editing invalid treatment' do
    find("a[href='/admin/treatments/#{(treatment.title).parameterize}/edit']").click
    find("input[@id='treatment_title']").set("")
    find("input[@id='treatment_tagline']").set("new tagline")
    find("textarea[@id='treatment_summary']").set("new summary")
    find("textarea[@id='treatment_description']").set("new description")
    find("input[@id='treatment_price']").set(40.23)
    click_button "Behandeling Aanpassen"

    expect(page).to have_content "Title can't be blank"
  end

  scenario 'an admin deletes a treatment' do
    click_link 'Verwijderen'
    expect(page).to have_css 'p', text: "De behandeling werd verwijderd"
    expect(page).to_not have_css 'a', text: "title1"
  end
end
