# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

g1 = Group.create(name: "The Dogans")
g2 = Group.create(name: "Moon Lit")

dert = User.create(username: "Derty", password_digest: "123", group_id: g1.id)
sarka = User.create(username: "Sarka", password_digest: "123", group_id: g2.id)
rary = User.create(username: "Rary", password_digest: "123", group_id: g2.id)
hal = User.create(username: "hal", password_digest: "123", group_id: Group.all.first.id)
# taro = Artist.create(name: "Taro", age: 26)
# jimmy = Artist.create(name: "Jimmy Lit", age: 27)


p1 = Post.create(user_id: dert.id, message:"What's the dealll??")
p2 = Post.create(user_id: sarka.id, message:"I'm in here")
p3 = Post.create(user_id: hal.id, message:"I'm in here")

c1 = Comment.create(user_id: rary.id, post_id:p3.id, message:"What??")

puts "done"