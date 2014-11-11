require 'rails_helper'

feature 'Visitor fills out contactform' do
  scenario 'and sees success message' do
    visit new_contact_path

    fill_in "Naam", with: "John Doe"
    fill_in "Email", with: "john.doe@example.com"
    fill_in "Telefoon", with: "0498132456"
    fill_in "Gewenste behandeling", with: "ik wens environ peeling kuur"
    click_button "Maak een Afspraak"

    expect(page).to have_css 'p', text: "Bedankt, ik neem zo spoedig mogelijk contact met je op"

  end

  scenario 'and sees error message when submitting invalid data' do
    visit new_contact_path

    fill_in "Naam", with: ""
    fill_in "Email", with: ""
    fill_in "Telefoon", with: ""
    fill_in "Gewenste behandeling", with: "geef een gewenste behandeling"
    click_button "Maak een Afspraak"

    expect(page).to have_css 'span.error', text: "naam is verplicht"
    expect(page).to have_css 'span.error', text: "email is verplicht"
    expect(page).to have_css 'span.error', text: "telefoonnummer is verplicht"
  end
end
