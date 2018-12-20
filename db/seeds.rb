# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Band.destroy_all
Album.destroy_all

b1 = Band.create!(name: "A Great Band")
b2 = Band.create!(name: "An Average Band")
b3 = Band.create!(name: "A Somewhat Bad Band")

a1 = b1.albums.create!(title: "Amazing Album", year: 1111)
a2 = b2.albums.create!(title: "Average Album", year: 2222)
