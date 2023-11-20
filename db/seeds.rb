# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts 'Wiping seeds'
Kitchen.destroy_all
User.destroy_all

puts 'Creating seeds'

william = User.create(first_name: 'william', last_name: 'varsovie', email: 'william.varsovie@gmail.com')
rhita = User.create(first_name: 'rhita', last_name: 'lamdouar', email: 'rhita.lamdouar@hotmail.com')
wilfried = User.create(first_name: 'timothé', last_name: 'zalo', email: 'zalo.timothe@gmail.com')
edward = User.create(first_name: 'edward', last_name: 'clary', email: 'edwardclary@gmail.com')

kitchen_one = Kitchen.create(name: 'Fully equipped', address: 'rue Oberkampf', capacity: 3, price: 100, equipment: "Oven Induction Blender", user: william)
kitchen_two = Kitchen.create(name: 'Ilôt central', address: 'rue des Dames', capacity: 6, price: 120, equipment: "Oven Induction Freezer Blender", user: wilfried)
kitchen_three = Kitchen.create(name: 'Ze Kitchen', address: 'rue de Paris', capacity: 20, price: 800, equipment: "Oven Microwave Induction Freezer", user: rhita)
kitchen_four = Kitchen.create(name: 'Apéro heaven', address: 'rue de la Paix', capacity: 8, price: 180, equipment: "Oven Microwave Blender", user: edward)
kitchen_five = Kitchen.create(name: 'Outdoor BBQ', address: 'rue de Rome', capacity: 30, price: 999, equipment: "Microwave Induction Blender", user: rhita)

puts 'Seeds created!'
