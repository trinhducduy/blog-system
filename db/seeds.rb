# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

author = User.create!(name:  "Duy Trinh Duc",
             email: "trinh.duc.duy@framgia.com",
             password:              "12345678",
             password_confirmation: "12345678")

10.times do |n|
  name  = Faker::Name.name
  email = "faker-#{n+1}@framgia.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
10.times do
  title = Faker::Name.title
  body = Faker::Lorem.paragraph(100, true)
  users.each do |user| 
    user.entries.create!(title: title, body: body)
    unless author.following?(user)
      author.follow(user)
    end
  end
end

