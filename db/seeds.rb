# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Group.destroy_all
Comment.destroy_all
Post.destroy_all



dert = User.create(username: "Derty", password: "123")
sarka = User.create(username: "Sarka", password: "123")
rary = User.create(username: "Rary", password: "123")
hal = User.create(username: "hal", password: "123")
# taro = Artist.create(name: "Taro", age: 26)
# jimmy = Artist.create(name: "Jimmy Lit", age: 27)

g1 = Group.create(name: "The Dogans",owner_id: dert.id)
g2 = Group.create(name: "Moon Lit",owner_id: hal.id)


p1 = Post.create(user_id: dert.id, group_id: g1.id, message:"What's the dealll??")
p2 = Post.create(user_id: sarka.id, group_id: g2.id,message:"I'm in here")
p3 = Post.create(user_id: hal.id, group_id: g1.id, message:"I'm in here")


#c1 = Comment.create(user_id: rary.id, post_id:p3.id, message:"What??")

puts "done"