require 'rails_helper'

feature 'Visitor visits treatments page' do
  scenario 'visitor views treatments' do
    treatment1 = Treatment.create(title: "treatment1", tagline: "tagline1", summary: "summary1", description: "description1")
    treatment2 = Treatment.create(title: "treatment2", tagline: "tagline2", summary: "summary2", description: "description2")

    visit behandelingen_path

    expect(page).to have_css 'h1', text: treatment1.title
    expect(page).to have_css 'h1', text: treatment2.title
  end
end
