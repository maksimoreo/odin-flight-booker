# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Current date and hour
now = DateTime.now.change(sec: 0, min: 0)

# Airports
Airport.delete_all
nyc = Airport.create(name: 'NYC')
sfo = Airport.create(name: 'SFO')

# Flights
Flight.delete_all
rand(3..6).times do
  Flight.create(from_airport: nyc, to_airport: sfo,
    start: now + rand(1..48).hours, duration: rand(4..7).hours.seconds)
end
rand(3..6).times do
  Flight.create(from_airport: sfo, to_airport: nyc,
    start: now + rand(1..48).hours, duration: rand(4..7).hours.seconds)
end
