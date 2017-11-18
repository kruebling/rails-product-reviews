require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit products_path
    click_link 'New Product'
    fill_in 'Name', :with => 'Marian HillBerry Ice Cream'
    fill_in 'Country', :with => 'United Stated'
    fill_in 'Cost', :with => '8'
    fill_in 'Featured', :with => 'true'
    click_on 'Submit'
    expect(page).to have_content 'Products'
  end

  it "gives error when no name is entered" do
    visit new_product_path
    click_on 'Submit'
    expect(page).to have_content 'errors'
  end
end

describe "the edit a product process" do
  it "edits an existing product" do
    product = Product.create(:name => 'Keegans Soap', :country => 'United States', :cost => '20', :featured => 'true')
    visit product_path(product)
    click_link 'Edit'
    fill_in 'Name', :with => 'Marian HillBerry Ice Cream'
    click_on 'Submit'
    expect(page).to have_content 'Product successfully updated!'
  end
end

describe "the delete a product process" do
  it "deletes an existing product" do
    product = Product.create(:name => 'Keegans Soap', :country => 'United States', :cost => '20', :featured => 'true')
    visit product_path(product)
    click_link 'Delete'
    expect(page).to have_content 'Product successfully removed!'
  end
end
