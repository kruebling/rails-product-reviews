require 'rails_helper'

describe Product, 'validation' do
  it { should validate_presence_of :name }
  it { should validate_presence_of :country }
  it { should validate_presence_of :cost }
end

describe Product, 'association' do
  it { should have_many :reviews }
end
