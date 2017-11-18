class Product < ActiveRecord::Base
  has_many :reviews
  validates_associated :reviews

  validates :name, :presence => true

  validates :country, :presence => true

  validates :cost, :presence => true
  validates :cost, numericality: true

  # Not currently working with Faker, booleans still generate
  # validates :featured, :presence

  scope :most_recent, -> { order(created_at: :desc).limit(3) }
  
  scope :origin_usa, -> { where(origin: "United States of America")}

  scope :most_reviews, -> {(
    select("products.id, products.name, products.country, products.cost, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(10)
  )}


  def self.featured
    where(featured: true)
  end

  def self.not_featured
    where(featured: false)
  end

end
