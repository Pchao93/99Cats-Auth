# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#:birth_date, :color, :name, :sex,

user1 = User.create(username: "chuck", password: "password")
user2 = User.create(username: "john", password: "password")
user3 = User.create(username: "cindy", password: "password")
user4 = User.create(username: "jenny", password: "password")

Cat.create(color: "grey", name: "nina", sex: "F", birth_date: "06/12/2012", user_id: user1.id)
Cat.create(color: "grey", name: "patches", sex: "F", birth_date: "06/12/2012", user_id: user2.id)
Cat.create(color: "grey", name: "east", sex: "F", birth_date: "06/12/2012", user_id: user3.id)
Cat.create(color: "grey", name: "charles", sex: "F", birth_date: "06/12/2012", user_id: user4.id)
Cat.create(color: "grey", name: "dog", sex: "F", birth_date: "06/12/2012", user_id: user2.id)
Cat.create(color: "grey", name: "Mr. Mittens", sex: "F", birth_date: "06/12/2012", user_id: user4.id)
