# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts "Destroying..."

Restaurant.destroy_all
User.destroy_all

puts "creating Users..."

3.times do
  User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: "#{Faker::Name.first_name}@gmail.com", password: "123456")
end

@users = User.all

puts "Creating Restaurants..."

5.times do
  Restaurant.create!(name: Faker::Restaurant.name, address: Faker::Address.full_address, category: Restaurant::CATEGORIES.sample, user_id: @users.sample.id)
end

puts "Seed is done!"
