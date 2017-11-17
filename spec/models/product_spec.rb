require 'rails_helper'

describe Product, 'validation' do
  it { should validate_presence_of :name }
  it { should validate_presence_of :country }
  it { should validate_presence_of :cost }
end

describe Product, 'association' do
  it { should have_many :reviews }
end

describe Product, 'column_specification' do
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:country).of_type(:string) }
  it { should have_db_column(:cost).of_type(:integer) }
  it { should have_db_column(:featured).of_type(:boolean) }
end
