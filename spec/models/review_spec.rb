require 'rails_helper'

describe Review, 'validation' do
  it { should validate_presence_of :author }
  it { should validate_presence_of :content_body }
  it { should validate_presence_of :rating }
  it { should validate_presence_of :product_id }

end

describe Review, 'association' do
  it { should belong_to :product }
end
