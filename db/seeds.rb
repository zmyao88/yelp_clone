# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Restaurant.destroy_all
Review.destroy_all
User.destroy_all

User.create(email:"alby@test.io", username: "byverdu",password:"12345678",password_confirmation:"12345678")
User.create(email:"sulby@test.io", username: "sulby", password:"12345678",password_confirmation:"12345678")

kfc = Restaurant.create(name: 'KFC',description: 'Kentucky Fried Chicken', cuisine: 'Fast Food' )
kfc.reviews.create(rating:1, thoughts:'bad'   , user_id: User.first.id )
kfc.reviews.create(rating:2, thoughts:'so so ', user_id: User.last.id )

jamie = Restaurant.create(name: 'Jamie´s', description: 'Italian Food', cuisine: 'Mediterranean'  )
jamie.reviews.create(rating:1, thoughts:'bad', user_id: User.first.id )
jamie.reviews.create(rating:2, thoughts:'so so ', user_id: User.last.id )

wagamama = Restaurant.create(name: 'wagamama',description: 'Best noodles in town', cuisine: 'Asian Food' )
wagamama.reviews.create(rating:1, thoughts:'bad', user_id: User.first.id )
wagamama.reviews.create(rating:2, thoughts:'so so ', user_id: User.last.id )


pret = Restaurant.create(name: 'Pret a manger', description: 'Coffee and sandwiches', cuisine: 'CoffeeShop'  )
pret.reviews.create(rating:1, thoughts:'bad', user_id: User.first.id )
pret.reviews.create(rating:2, thoughts:'so so ', user_id: User.last.id )


macdonalds = Restaurant.create(name: 'macdonalds',description: 'Old Fashion burgers', cuisine: 'Fast Food' )
macdonalds.reviews.create(rating:1, thoughts:'bad', user_id: User.first.id )
macdonalds.reviews.create(rating:2, thoughts:'so so ', user_id: User.last.id )

gola = Restaurant.create(name: 'Gola´s', description: 'Italian Food', cuisine: 'Mediterranean'  )
gola.reviews.create(rating:1, thoughts:'bad', user_id: User.first.id )
gola.reviews.create(rating:2, thoughts:'so so ', user_id: User.last.id )

