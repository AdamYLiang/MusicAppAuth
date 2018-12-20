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
Track.destroy_all

b1 = Band.create!(name: "A Great Band")
b2 = Band.create!(name: "An Average Band")
b3 = Band.create!(name: "A Somewhat Bad Band")

a1 = b1.albums.create!(title: "Amazing Album", year: 1111)
a2 = b2.albums.create!(title: "Average Album", year: 2222)

t1 = a1.tracks.create!(title: "Amazing Song", ord: 1, band_id: a1.band.id)
a1.tracks.create!(title: "Amazing Song 2", ord: 2, band_id: a1.band.id)
a1.tracks.create!(title: "Amazing Song 3", ord: 3, band_id: a1.band.id)
a1.tracks.create!(title: "Amazing Song4 ", ord: 4, band_id: a1.band.id)


t2 = a2.tracks.create!(title: "Average Song", ord: 1, band_id: a2.band.id)
a2.tracks.create!(title: "Average Song 2", ord: 2, band_id: a2.band.id)
a2.tracks.create!(title: "Average Song 3", ord: 3, band_id: a2.band.id)
a2.tracks.create!(title: "Average Song4 ", ord: 4, band_id: a2.band.id)