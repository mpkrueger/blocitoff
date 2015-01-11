require 'faker'

# Create 10 users
10.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

# Create 1 list for each users
10.times do
  list = List.create!(
    user: users.sample,
    title: Faker::Lorem.sentence
  )
end
lists = List.all

# Create 100 items
100.times do
  item = Item.create!(
    list: lists.sample,
    name: Faker::Lorem.sentence
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Item.count} items created"