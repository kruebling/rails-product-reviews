require 'rails_helper'

describe "the add a review process" do
  it "adds a new review to the Product" do
    product = Product.create(:name => '', :country => '', :origin => '')
    visit new_product_review_path
    click_link 'Add a Review'
    fill_in 'Author', :with => 'Franz'
    fill_in 'Content body', :with => 'I loved it, best ice cream Ive ever had'
    fill_in 'Rating', :with => '5'
    click_on 'Submit'
    expect(page).to have_content 'Reviews'
  end

  it "gives error when no name is entered" do
    visit new_product_review_path
    click_on 'Submit'
    expect(page).to have_content 'errors'
  end
end
