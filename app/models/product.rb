class Product < ActiveRecord::Base
  has_many :reviews

  validates :name, :presence => true
  validates :country, :presence => true
  validates :cost, :presence => true
  validates :cost, numericality: true
  # Not currently working with Faker
  # validates :featured, :presence => true

  def self.featured
    where(featured: true)
  end

  def self.not_featured
    where(featured: false)
  end

end
