# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

categories = %w[chinese italian japanese french belgian]

puts 'creating 10 restaurants'
12.times do
  res = Restaurant.new(
    name: Faker::Coffee.blend_name,
    address: Faker::Coffee.origin,
    phone_number: Faker::PhoneNumber.phone_number,
    category: categories.sample
  )
  res.save
  puts "#{res.name} created"
  puts 'creating 5 reviews for this restaurants'
  5.times do
    res.reviews.create(
      rating: (0..5).to_a.sample,
      content: Faker::Lorem.paragraph
    )
  end
end
puts 'all restaurants created'
