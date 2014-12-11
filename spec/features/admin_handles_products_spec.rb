require 'rails_helper'

feature 'Admin interacts with products' do
  let!(:product) { create(:product) }
  scenario 'admin views products' do
    visit admin_products_path

    expect(page).to have_css 'td', text: product.title
  end

  scenario 'admin sees message when no products available' do
    Product.destroy(product)
    visit admin_products_path

    expect(page).to have_css 'p', text: "Er zijn momenteel geen producten, voeg een nieuw product toe"
  end

  scenario 'admin clicks on product title and sees product details' do
    visit admin_products_path
    click_link product.title

    expect(page).to have_css 'h1', text: product.title
    expect(page).to have_css 'p', text: product.description
    expect(page).to have_xpath("//img[contains(@src,'#{File.basename(product.image.url)}')]") 
  end

  scenario 'admin sees success message when add a valid product' do
    visit admin_products_path

    find("input[@value='Product Toevoegen']").click
    fill_in 'Titel', with: "some title"
    fill_in 'Beschrijving', with: "some description"
    click_button 'Product Toevoegen'

    expect(page).to have_css 'p', text: "Er werd een nieuw product toegevoegd"
    expect(page).to have_css 'a', text: "some title"
  end

  scenario 'admin sees error message when adding an invalid product' do
    visit admin_products_path

    find("input[@value='Product Toevoegen']").click
    fill_in 'Titel', with: ""
    fill_in 'Beschrijving', with: "some description"
    click_button 'Product Toevoegen'

    expect(page).to have_css 'p', text: "Title can't be blank"
  end

  scenario 'admin sees success message when editing a product' do
    visit admin_products_path
    
    find("a[href='/admin/products/#{product.id}/edit']").click
    find("input[@id='product_title']").set("new title")
    find("textarea[@id='product_description']").set("new description")
    click_button "Product Aanpassen"

    expect(page).to have_css 'p', text: "Het product \"new title\" werd aangepast"
    expect(page).to have_css 'a', text: "new title"
  end

  scenario 'admin sees error message when editing invalid promotion' do
    visit admin_products_path
    
    find("a[href='/admin/products/#{product.id}/edit']").click
    find("input[@id='product_title']").set("")
    find("textarea[@id='product_description']").set("new description")
    click_button "Product Aanpassen"

    expect(page).to have_css 'p', text: "Title can't be blank"
  end

  scenario 'an admin deletes a promotion' do
    visit admin_products_path

    click_link 'Verwijderen'

    expect(page).to have_css 'p', text: "Het product werd verwijderd"
    expect(page).to_not have_css 'a', text: product.title
  end
end
