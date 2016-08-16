# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Review.destroy_all
Booking.destroy_all
Availability.destroy_all
Service.destroy_all
User.destroy_all

toto = User.create!(email:"toto@gmail.com", password:"123456")

service1 = toto.services.create!(description:"english", city:"Lille")
service2 = toto.services.create!(description:"maths", city:"Lille")

service1.availabilities.create!(startdate:Date.today + 2, enddate:Date.today + 3)
service1.availabilities.create!(startdate:Date.today - 1, enddate:Date.today)

service2.availabilities.create!(startdate:Date.today - 1, enddate:Date.today)

booking1 = Booking.new(user:toto, service:service1, startdate:Date.today + 2.5, enddate:Date.today + 2.8)
booking2 = Booking.new(user:toto, service:service2, startdate:Date.today - 0.5, enddate:Date.today - 0.1)

booking1.save
booking2.save

adrien = User.create!(email:"adrien@gmail.com", password:"123456")

r = Review.new(description: "good", stars: "5", sender:adrien, recipient:toto)

r.save
