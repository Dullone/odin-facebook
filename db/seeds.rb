# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(
    name: "Ruby",
    email: "Ruby@example.com",
    password:  "password",
    password_confirmation:  "password",
    location: "Your computer, localhost",
    job: "Programming lanuage",
    interests: "Running code\nCreating objects\nWriting files"
  )
user2 = User.create(
    name: "Somebody",
    email: "Some@example.com",
    password:  "password",
    password_confirmation:  "password",
    location: "Here",
    job: "Placeholder object",
    interests: "Holding\nPlacing\nEating"
  )
user3 = User.create(
    name: "Duddly",
    email: "Dud@example.com",
    password:  "password",
    password_confirmation:  "password",
    location: "11 n Highway Rd",
    job: "Fletcher",
    interests: "Making arrows\nFlying kites\nBasketball"
  )

40.times do
    text = Faker::Lorem.sentence(3)
    user1.posts.create!(text: text)
end