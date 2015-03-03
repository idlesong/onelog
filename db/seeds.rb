# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Users
User.create!(name: "Example User",
             password:              "test",
             password_confirmation: "test",
            )

99.times do |n|
  #name = Faker::Name.name
  name = "ExUser-#{n+1}"
  password = "test"
  User.create!( name: name,
                password:              password,
                password_confirmation: password)
end

# Microposts
users = User.order(:created_at).take(6)
50.times do
  #content = Faker::Lorem.sentence(5)
  content = "Hello my world, my log space, it's the place will never lost"
  users.each { |user| user.posts.create!(content: content) }
end

# Following relationships
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
