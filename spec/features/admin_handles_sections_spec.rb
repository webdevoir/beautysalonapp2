require 'rails_helper'

feature 'Admin does CRUD operations on sections' do
  let!(:section) { create(:section) }
  before do
    visit admin_sections_path
  end
  scenario 'admin views sections' do
    expect(page).to have_css 'td', text: section.title
  end

  scenario 'admin clicks on section title and sees section details' do
    click_link section.title

    expect(page).to have_css 'h1', text: section.title
    expect(page).to have_css 'p', text: section.description
  end

  scenario 'admin sees success message when adding a valid product' do
    find("input[@value='Sectie Toevoegen']").click
    fill_in 'Titel', with: "some title"
    fill_in 'Beschrijving', with: "some description"
    click_button 'Sectie Toevoegen'

    expect(page).to have_css 'p', text: "Er werd een nieuwe sectie toegevoegd"
    expect(page).to have_css 'a', text: "some title"
  end

  scenario 'admin sees error message when adding an invalid product' do
    find("input[@value='Sectie Toevoegen']").click
    fill_in 'Titel', with: ""
    fill_in 'Beschrijving', with: "some description"
    click_button 'Sectie Toevoegen'

    expect(page).to have_css 'p', text: "Title can't be blank"
  end

  scenario 'admin sees succes message when editing a section' do
    find("a[href='/admin/sections/#{section.id}/edit']").click
    find("input[@id='section_title']").set("new title")
    find("textarea[@id='section_description']").set("new description")
    click_button "Sectie Aanpassen"

    expect(page).to have_css 'p', text: "De sectie werd aangepast"
    expect(page).to have_css 'a', text: "new title"
  end

  scenario 'admin sees error message when editing invalid promotion' do
    find("a[href='/admin/sections/#{section.id}/edit']").click
    find("input[@id='section_title']").set("")
    find("textarea[@id='section_description']").set("new description")
    click_button "Sectie Aanpassen"

    expect(page).to have_css 'p', text: "Title can't be blank"
  end

  scenario 'an admin deletes a section' do
    click_link 'Verwijderen'

    expect(page).to have_css 'p', text: "De sectie werd verwijderd"
    expect(page).not_to have_css 'a', text: section.title
  end
end
