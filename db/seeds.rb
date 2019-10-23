# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

gabe = User.create(name: 'Gabe', password_digest: BCrypt::Password.create('gabe'), email: 'gabe@ga.com')
gabe_trip = Trip.create(destination: 'Australia', start_date: 2019 - 10 - 22, num_of_days: 20, user_id: gabe.id)
Activity.create(title: 'city-tour', time: '07:00', description: 'city tour in Sydney CBD', start_date: 2019 - 10 - 22, end_date: 2019 - 10 - 22, trip_id: gabe_trip.id)

gabe_trip1 = Trip.create(destination: 'Australia', start_date: 2019 - 10 - 22, num_of_days: 20, user_id: gabe.id)
gabe_trip2 = Trip.create(destination: 'Australia', start_date: 2019 - 10 - 22, num_of_days: 20, user_id: gabe.id)
gabe_trip3 = Trip.create(destination: 'Australia', start_date: 2019 - 10 - 22, num_of_days: 20, user_id: gabe.id)


puts '--------> seed has been planted  <------------'