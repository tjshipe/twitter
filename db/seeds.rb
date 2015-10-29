# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Creating 5 users..."

5.times do |i|
  User.create({email: "user#{i}@gmail.com", password: 'password', password_confirmation: 'password'})
end

puts "Creating 5 posts..."

5.times do |i|
  Post.create({body: "This is test post number ##{i}", user_id: User.last.id})
end

puts "Following a user..."

User.find_each do |user|
  user.followed_users << User.last unless user.id == User.last.id
end