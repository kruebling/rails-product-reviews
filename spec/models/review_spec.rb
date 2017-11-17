require 'rails_helper'

describe Review, 'validation' do
  it { should validate_presence_of :author }

  it { should validate_presence_of :content_body }
  it { should validate_length_of(:content_body).is_at_most(250) }
  it { should validate_length_of(:content_body).is_at_least(50) }

  it { should validate_presence_of :rating }
  it { should validate_inclusion_of(:rating).in_range(1..5) }

  it { should validate_presence_of :product_id }
end

describe Review, 'association' do
  it { should belong_to :product }
end

describe Review, 'column_specification' do
  it { should have_db_column(:author).of_type(:string) }
  it { should have_db_column(:content_body).of_type(:text) }
  it { should have_db_column(:rating).of_type(:integer) }
  it { should have_db_column(:product_id).of_type(:integer) }
end
