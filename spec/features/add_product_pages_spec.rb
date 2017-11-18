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
