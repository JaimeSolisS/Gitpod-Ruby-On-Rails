# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create!( username: '@user1', name: 'user1', avatar: 'pic1')
user2 = User.create!( username: '@user2', name: 'user2', avatar: 'pic2')

user1.tweets.create!(text: 'Hello world')
user1.tweets.create!(text: 'Hello world 2')

user2.tweets.create!(text: 'Hola mundo')
user2.tweets.create!(text: 'Hola mundo 2')

