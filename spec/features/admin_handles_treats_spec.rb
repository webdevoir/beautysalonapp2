require 'rails_helper'

feature 'Admin interacts with treats' do
  scenario 'admin views treats' do
    treat = Treat.create(title: "behandeling1", tagline: "tagline1", summary: "summary1", description: "description1", price: 40.23)

    visit admin_treats_path
    
    expect(page).to have_css 'td', text: treat.title
  end

  scenario 'admin sees message when no treats available' do
    visit admin_treats_path

    expect(page).to have_css 'p', text: 'Er zijn momenteel geen behandelingen, voeg een nieuwe behandeling toe'
  end

  scenario 'admin clicks on treatment title and sees treatment details' do
    treat = Treat.create(title: "behandeling1", tagline: "tagline1", summary: "summary1", description: "description1", price: 40.23)

    visit admin_treats_path
    click_link treat.title

    expect(page).to have_css 'h1', text: treat.title
    expect(page).to have_css 'p', text: treat.tagline
    expect(page).to have_css 'p', text: treat.summary
    expect(page).to have_css 'p', text: treat.description
    expect(page).to have_css 'p', text: treat.price
  end

  scenario 'admin sees success message when adding a valid treat' do
    visit admin_treats_path

    find("input[@value='Behandeling Toevoegen']").click
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
    visit admin_treats_path
    
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
    treat = Treat.create(title: "title1", tagline: "tagline1", summary: "summary1", description: "description1", price: 40.23)
    visit admin_treats_path

    find("a[href='/admin/treats/#{treat.id}/edit']").click
    find("input[@id='treat_title']").set("new title")
    find("input[@id='treat_tagline']").set("new tagline")
    find("textarea[@id='treat_summary']").set("new summary")
    find("textarea[@id='treat_description']").set("new description")
    find("input[@id='treat_price']").set(40.23)
    click_button "Behandeling Aanpassen"

    expect(page).to have_content "De behandeling werd aangepast"
    expect(page).to have_css 'a', text: "new title"
  end

  scenario 'admin sees error message when editing invalid treatment' do
    treat = Treat.create(title: "title1", tagline: "tagline1", summary: "summary1", description: "description1", price: 40.23)
    visit admin_treats_path

    find("a[href='/admin/treats/#{treat.id}/edit']").click
    find("input[@id='treat_title']").set("")
    find("input[@id='treat_tagline']").set("new tagline")
    find("textarea[@id='treat_summary']").set("new summary")
    find("textarea[@id='treat_description']").set("new description")
    find("input[@id='treat_price']").set(40.23)
    click_button "Behandeling Aanpassen"

    expect(page).to have_content "Title can't be blank"
  end

  scenario 'an admin deletes a treatment' do
    treat = Treat.create(title: "title1", tagline: "tagline1", summary: "summary1", description: "description1", price: 40.23)

    visit admin_treats_path

    click_link 'Verwijderen'
    expect(page).to have_content, text: "De behandeling werd verwijderd"
    expect(page).to_not have_css 'a', text: "title1"
  end
end
