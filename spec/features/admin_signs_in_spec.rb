require 'rails_helper'

feature 'admin signs in' do
  before do
    visit signin_path
  end

  scenario 'admin successfuly signs in' do
    alice = create(:user, admin: true)

    sign_in(alice.email, alice.password)

    expect(page).to have_content alice.name
    expect(page).to have_css 'a', text: "Sign Out"
    expect(page).to have_css 'a[class="sign-up"]', text: "Admin"
    expect(current_path).to eq("/admin")
  end

  scenario 'admin signs in with invalid credentials' do
    alice = create(:user, admin: true)

    sign_in("invalid email", alice.password)

    expect(page).to have_content "Wrong Email/Password combination"
    expect(page).to_not have_css 'a[class="sign-up"]', text: "Admin"
  end

  scenario 'admin signs out' do
    alice = create(:user, admin: true)

    sign_in(alice.email, alice.password)
    click_link "Sign Out"

    expect(page).to have_content "Je bent uitgelogd!"
    expect(current_path).to eq("/")
    expect(page).not_to have_css 'a[class="sign-up"]', text: "Admin"
  end

  scenario 'a regular user should not have access to the dashboard' do
    alice = create(:user, admin: false)

    sign_in(alice.email, alice.password)

    expect(page).to have_css 'p', text: "Unauthorized access!"
    expect(page).to_not have_css 'a[class="sign-up"]', text: "Admin"
    expect(current_path).to eq("/")
  end

  def sign_in(email, password)
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Sign in"
  end
end
