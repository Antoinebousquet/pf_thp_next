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

Patient.create(first_name: "Arnaud", last_name: "Dumont" , email: "arnaud.dumont@yopmail.com", password: "azerty", sexe: Faker::Gender.binary_type, treatment: Faker::Science.element, birth: Faker::Date.birthday(min_age: 18, max_age: 65), phone: Faker::PhoneNumber.phone_number, city: Faker::Address.city )
  
Practionner.create(first_name: "Jean", last_name: "Dubois" , email: "jean.dubois@yopmail.com", password: "azerty", sexe: Faker::Gender.binary_type, specialty: Faker::Educator.subject, adress: Faker::Address.full_address, diploma: Faker::Educator.degree)

Appointment.create(date: Date.today, place: Faker::Address.city, 
  patient_id: 1, practionner_id: 1)

5.times do |user|

  @patient = Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name , email: "patient#{user}@yopmail.com", password: "azerty", sexe: Faker::Gender.binary_type, treatment: Faker::Science.element, birth: Faker::Date.birthday(min_age: 18, max_age: 65), phone: Faker::PhoneNumber.phone_number, city: Faker::Address.city )
  count_day = 1

  20.times do |data_chart|
    Day.create(date: Faker::Date.between(from: 10.days.ago, to: Date.today), hours_of_sleep: rand(3..7),
      mood: rand(1..9), treatment: rand(-1..1), created_at: DateTime.new(2015, 6, count_day))
    DataShow.create(patient_id: @patient.id, day_id: count_day)
    count_day += 1
  end
  puts "One patient and 25 associated days have been created. The patient email : patient#{user}@yopmail.com. The password : azerty."

  @practionner = Practionner.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name , email: "practionner#{user}@yopmail.com", password: "azerty", sexe: Faker::Gender.binary_type, specialty: Faker::Educator.subject, adress: Faker::Address.full_address, diploma: Faker::Educator.degree)

  3.times do |appointment|
    Appointment.create(date: Faker::Date.between(from: 10.days.ago, to: Date.today), place: Faker::Address.city, 
    patient_id: Patient.all.sample.id, practionner_id: @practionner.id, created_at: DateTime.new(2020, 1, 7) )
  end
  puts "One practionner and 5 associated appointments have been created. The practionner email : practionner#{user}@yopmail.com. The password : azerty."

end

Appointment.create(date: Faker::Date.between(from: 10.days.ago, to: Date.today), place: Faker::Address.city, 
    patient_id: 2, practionner_id: 1, created_at: DateTime.new(2020, 1, 7) )
Appointment.create(date: Faker::Date.between(from: 10.days.ago, to: Date.today), place: Faker::Address.city, 
    patient_id: 3, practionner_id: 1, created_at: DateTime.new(2020, 1, 7) )
Appointment.create(date: Faker::Date.between(from: 10.days.ago, to: Date.today), place: Faker::Address.city, 
    patient_id: 4, practionner_id: 1, created_at: DateTime.new(2020, 1, 7) )

  Day.create(date: Faker::Date.between(from: 10.days.ago, to: Date.today), hours_of_sleep: 7,
    mood: 4, treatment: 1, created_at: DateTime.new(2015, 6, 1))
  DataShow.create(patient_id: 1, day_id: 101)

  Day.create(date: Faker::Date.between(from: 10.days.ago, to: Date.today), hours_of_sleep: 8,
    mood: 4, treatment: 1, created_at: DateTime.new(2015, 6, 2))
  DataShow.create(patient_id: 1, day_id: 102)

  Day.create(date: Faker::Date.between(from: 10.days.ago, to: Date.today), hours_of_sleep: 8,
    mood: 4, treatment: 1, created_at: DateTime.new(2015, 6, 3))
  DataShow.create(patient_id: 1, day_id: 103)

  Day.create(date: Faker::Date.between(from: 10.days.ago, to: Date.today), hours_of_sleep: 7,
    mood: 3, treatment: 0, created_at: DateTime.new(2015, 6, 4))
  DataShow.create(patient_id: 1, day_id: 104)

  Day.create(date: Faker::Date.between(from: 10.days.ago, to: Date.today), hours_of_sleep: 7,
    mood: 4, treatment: 1, created_at: DateTime.new(2015, 6, 5))
  DataShow.create(patient_id: 1, day_id: 105)

  Day.create(date: Faker::Date.between(from: 10.days.ago, to: Date.today), hours_of_sleep: 6,
    mood: 2, treatment: 0, created_at: DateTime.new(2015, 6, 6))
  DataShow.create(patient_id: 1, day_id: 106)

  Day.create(date: Faker::Date.between(from: 10.days.ago, to: Date.today), hours_of_sleep: 7,
    mood: 0, treatment: 1, created_at: DateTime.new(2015, 6, 7))
  DataShow.create(patient_id: 1, day_id: 107)

  Day.create(date: Faker::Date.between(from: 10.days.ago, to: Date.today), hours_of_sleep: 6,
    mood: -1, treatment: 0, created_at: DateTime.new(2015, 6, 8))
  DataShow.create(patient_id: 1, day_id: 108)

  Day.create(date: Faker::Date.between(from: 10.days.ago, to: Date.today), hours_of_sleep: 5,
    mood: -2, treatment: -1, created_at: DateTime.new(2015, 6, 9))
  DataShow.create(patient_id: 1, day_id: 109)

  Day.create(date: Faker::Date.between(from: 10.days.ago, to: Date.today), hours_of_sleep: 5,
    mood: -2, treatment: -1, created_at: DateTime.new(2015, 6, 10))
  DataShow.create(patient_id: 1, day_id: 110)

  Day.create(date: Faker::Date.between(from: 10.days.ago, to: Date.today), hours_of_sleep: 3,
    mood: -3, treatment: -1, created_at: DateTime.new(2015, 6, 11))
  DataShow.create(patient_id: 1, day_id: 111)

  Day.create(date: Faker::Date.between(from: 10.days.ago, to: Date.today), hours_of_sleep: 3,
    mood: -3, treatment: -1, created_at: DateTime.new(2015, 6, 12))
  DataShow.create(patient_id: 1, day_id: 112)

  Day.create(date: Faker::Date.between(from: 10.days.ago, to: Date.today), hours_of_sleep: 4,
    mood: -2, treatment: -1, created_at: DateTime.new(2015, 6, 13))
  DataShow.create(patient_id: 1, day_id: 113)

  Day.create(date: Faker::Date.between(from: 10.days.ago, to: Date.today), hours_of_sleep: 11,
    mood: -2, treatment: -1, created_at: DateTime.new(2015, 6, 14))
  DataShow.create(patient_id: 1, day_id: 114)

  Day.create(date: Faker::Date.between(from: 10.days.ago, to: Date.today), hours_of_sleep: 9,
    mood: 0, treatment: -1, created_at: DateTime.new(2015, 6, 15))
  DataShow.create(patient_id: 1, day_id: 115)

  Day.create(date: Faker::Date.between(from: 10.days.ago, to: Date.today), hours_of_sleep: 9,
    mood: -1, treatment: 1, created_at: DateTime.new(2015, 6, 16))
  DataShow.create(patient_id: 1, day_id: 116)

  Day.create(date: Faker::Date.between(from: 10.days.ago, to: Date.today), hours_of_sleep: 8,
    mood: 1, treatment: 1, created_at: DateTime.new(2015, 6, 17))
  DataShow.create(patient_id: 1, day_id: 117)

  Day.create(date: Faker::Date.between(from: 10.days.ago, to: Date.today), hours_of_sleep: 7,
    mood: 2, treatment: 1, created_at: DateTime.new(2015, 6, 18))
  DataShow.create(patient_id: 1, day_id: 118)

  Day.create(date: Faker::Date.between(from: 10.days.ago, to: Date.today), hours_of_sleep: 8,
    mood: 2, treatment: 0, created_at: DateTime.new(2015, 6, 19))
  DataShow.create(patient_id: 1, day_id: 119)

  Day.create(date: Faker::Date.between(from: 10.days.ago, to: Date.today), hours_of_sleep: 7,
    mood: 1, treatment: 1, created_at: DateTime.new(2015, 6, 20))
  DataShow.create(patient_id: 1, day_id: 120)

  Day.create(date: Faker::Date.between(from: 10.days.ago, to: Date.today), hours_of_sleep: 6,
    mood: 2, treatment: 1, created_at: DateTime.new(2015, 6, 21))
  DataShow.create(patient_id: 1, day_id: 121)

  Day.create(date: Faker::Date.between(from: 10.days.ago, to: Date.today), hours_of_sleep: 6,
    mood: 3, treatment: 1, created_at: DateTime.new(2015, 6, 22))
  DataShow.create(patient_id: 1, day_id: 122)

  Day.create(date: Faker::Date.between(from: 10.days.ago, to: Date.today), hours_of_sleep: 6,
    mood: 1, treatment: 0, created_at: DateTime.new(2015, 6, 23))
  DataShow.create(patient_id: 1, day_id: 123)

  Day.create(date: Faker::Date.between(from: 10.days.ago, to: Date.today), hours_of_sleep: 6,
    mood: 1, treatment: 0, created_at: DateTime.new(2015, 6, 24))
  DataShow.create(patient_id: 1, day_id: 124)

  

  puts "Example patient and 24 data created"
