Product.destroy_all

50.times do |index|
  Product.create!(name: Faker::Food.dish, country: Faker::Address.country, cost: Faker::Number.decimal(2), featured: Faker::Boolean::boolean(0.5))
end

Review.destroy_all

250.times do |index|
  Review.create!( author: Faker::Dune.character, content_body: Faker::Hipster.paragraph, rating: Faker::Number.between(1, 5), product_id: Faker::Number.between(1, 50))
end

p "Created #{Product.count} products and #{Review.count} reviews."
