# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Practionner.destroy_all
Patient.destroy_all
Appointment.destroy_all
Day.destroy_all
DataShow.destroy_all

5.times do |user|

  @patient = Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name , email: "patient#{user}@yopmail.com", password: "azerty", sexe: Faker::Gender.binary_type, treatment: Faker::Science.element, birth: Faker::Date.birthday(min_age: 18, max_age: 65), phone: Faker::PhoneNumber.phone_number, city: Faker::Address.city )
  count_day = 1

  20.times do |data_chart|
    Day.create(date: Faker::Date.between(from: 10.days.ago, to: Date.today), hours_of_sleep: rand(3..7),
      mood: rand(1..9), created_at: DateTime.new(2015, 6, count_day))
    DataShow.create(patient_id: @patient.id, day_id: count_day)
    count_day += 1
  end
  puts "One patient and 25 associated days have been created. The patient email : patient#{user}@yopmail.com. The password : azerty."

  @practionner = Practionner.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name , email: "practionner#{user}@yopmail.com", password: "azerty", sexe: Faker::Gender.binary_type, specialty: Faker::Educator.subject, adress: Faker::Address.full_address, diploma: Faker::Educator.degree)

  3.times do |appointment|
    Appointment.create(date: Faker::Date.between(from: 10.days.ago, to: Date.today), place: Faker::Address.city, 
    patient_id: Patient.all.sample.id, practionner_id: @practionner.id )
  end
  puts "One practionner and 5 associated appointments have been created. The practionner email : practionner#{user}@yopmail.com. The password : azerty."

end
