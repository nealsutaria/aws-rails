# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Prescription.create(name: "Yes")
# Prescription.create(name: "No")

# Xray.create(name: "Yes")
# Xray.create(name: "No")

# Test.create(name: "Yes")
# Test.create(name: "No")

user1 = User.create!(
  email: Faker::Internet.email,
  password: "Pie123##",
  username: Faker::BackToTheFuture.character,
  state: "CT",
  city: "Cedar Park",
  birthdate: "05/26/1999"
  )
user2 = User.create(
  email: Faker::Internet.email,
  password: "Pie123##",
  username: Faker::BackToTheFuture.character,
  state: "CT",
  city: "Cedar Park",
  birthdate: "05/26/1999"
  )
user3 = User.create(
  email: Faker::Internet.email,
  password: "Pie123##",
  username: Faker::BackToTheFuture.character,
  state: "CT",
  city: "Cedar Park",
  birthdate: "05/26/1999"
  )
user4 = User.create(
  email: Faker::Internet.email,
  password: "Pie123##",
  username: Faker::BackToTheFuture.character,
  state: "CT",
  city: "Cedar Park",
  birthdate: "05/26/1999"
  )
user5 = User.create(
  email: Faker::Internet.email,
  password: "Pie123##",
  username: Faker::BackToTheFuture.character,
  state: "CT",
  city: "Cedar Park",
  birthdate: "05/26/1999"
  )

d = DateTime.parse("7 may 2018 05:03")

Record.create!( date: d, name: "Other", description: "Other",
  description_other: "skin cancer test", name_other: "hand check up", user: user1)

Record.create!( date: d, name: "Other", description: "Other",
  description_other: "heart test", name_other: "foot check up", user: user2)

Record.create!( date: d, name: "Other", description: "Other",
  description_other: "eye test", name_other: "elbow check up", user: user3)

Record.create!( date: d, name: "Other", description: "Other",
  description_other: "lung test", name_other: "heart check up", user: user4)

Record.create!( date: d, name: "Other", description: "Other",
  description_other: "heart test", name_other: "dermatologist skin checkup", user: user5)
