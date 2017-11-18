require 'rails_helper'

describe "the add a review process" do
  it "adds a new review to the Product" do
    product = Product.create(:name => 'Keegans Soap', :country => 'United States', :cost => '20', :featured => 'true')
    visit product_path(product)
    click_link 'Add a Review'
    fill_in 'Author', :with => 'Franz'
    fill_in 'Content body', :with => 'I loved it, best ice cream Ive ever had, gonna continue writing now because my review has to include at least 50 characters. Great requirement Franz.'
    fill_in 'Rating', :with => '5'
    click_on 'Submit'
    expect(page).to have_content 'Review'
  end

  it "gives error when no name is entered" do
    product = Product.create(:name => 'Keegans Soap', :country => 'United States', :cost => '20', :featured => 'true')
    visit product_path(product)
    click_link 'Add a Review'
    click_on 'Submit'
    expect(page).to have_content 'errors'
  end
end

describe "the edit a review process" do
  it "edits an exisiting review to the Product" do
    product = Product.create(:name => 'Keegans Soap', :country => 'United States', :cost => '20', :featured => 'true')
    review = Review.create(:author => 'Keegans Soap', :content_body => '50 char limit 50 char limit 50 char limit 50 char limit 50 char limit', :rating => '5', :product_id => product.id)
    visit edit_product_review_path(product, review)
    fill_in 'Author', :with => 'Franz'
    click_on 'Submit'
    expect(page).to have_content 'Review successfully updated!'
  end
end

describe "the delete a review process" do
  it "deletes an exisiting review to the Product" do
    product = Product.create(:name => 'Keegans Soap', :country => 'United States', :cost => '20', :featured => 'true')
    review = Review.create(:author => 'Keegans Soap', :content_body => '50 char limit 50 char limit 50 char limit 50 char limit 50 char limit', :rating => '5', :product_id => product.id)
    visit product_path(product)
    click_on 'Delete Review'
    expect(page).to have_content 'Review successfully deleted!'
  end
end
