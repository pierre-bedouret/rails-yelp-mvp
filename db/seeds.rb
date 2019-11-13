require 'faker'

puts 'Cleaning database...'
Restaurant.destroy_all
Review.destroy_all

category = ["chinese", "italian", "japanese", "french", "belgian"]

puts 'Creating 20 fake restaurants...'
20.times do
  restaurants_attributes = {
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    category:  category[rand(0..category.size - 1)],
    phone_number: Faker::PhoneNumber.cell_phone
  }

  resto = Restaurant.create!(restaurants_attributes)

  puts 'Creating between 1 and 5 fake rewiews...'
  rand(1..5).times do
    reviews_attributes = {
      content: Faker::ChuckNorris.fact,
      rating: rand(0..5),
      restaurant_id: resto.id
    }

    Review.create!(reviews_attributes)
  end
  puts 'Finished Reviews for This Restaurant!'
end
puts 'Finished Restaurants!'
