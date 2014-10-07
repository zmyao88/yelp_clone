# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Restaurant.destroy_all
Review.destroy_all


kfc = Restaurant.create(name: 'KFC',description: 'Kentucky Fried Chicken', cuisine: 'Fast Food' )
kfc.reviews.create(rating:1, thoughts:'bad')
kfc.reviews.create(rating:2, thoughts:'so so ')
kfc.reviews.create(rating:3, thoughts:'too fried')
kfc.reviews.create(rating:4, thoughts:'bad')
kfc.reviews.create(rating:5, thoughts:'great')
kfc.reviews.create(rating:3, thoughts:'bad')


jamie = Restaurant.create(name: 'Jamie´s', description: 'Italian Food', cuisine: 'Mediterranean'  )
jamie.reviews.create(rating:1, thoughts:'bad')
jamie.reviews.create(rating:2, thoughts:'so so ')
jamie.reviews.create(rating:3, thoughts:'too fried')
jamie.reviews.create(rating:4, thoughts:'bad')
jamie.reviews.create(rating:5, thoughts:'great')
jamie.reviews.create(rating:3, thoughts:'')

wagamama = Restaurant.create(name: 'wagamama',description: 'Best noodles in town', cuisine: 'Asian Food' )
wagamama.reviews.create(rating:1, thoughts:'bad')
wagamama.reviews.create(rating:2, thoughts:'so so ')
wagamama.reviews.create(rating:3, thoughts:'too fried')
wagamama.reviews.create(rating:4, thoughts:'bad')
wagamama.reviews.create(rating:5, thoughts:'great')
wagamama.reviews.create(rating:3, thoughts:'bad')


pret = Restaurant.create(name: 'Pret a manger', description: 'Coffee and sandwiches', cuisine: 'CoffeeShop'  )
pret.reviews.create(rating:1, thoughts:'bad')
pret.reviews.create(rating:2, thoughts:'so so ')
pret.reviews.create(rating:3, thoughts:'too fried')
pret.reviews.create(rating:4, thoughts:'bad')
pret.reviews.create(rating:5, thoughts:'great')
pret.reviews.create(rating:3, thoughts:'')

macdonalds = Restaurant.create(name: 'macdonalds',description: 'Old Fashion burgers', cuisine: 'Fast Food' )
macdonalds.reviews.create(rating:1, thoughts:'bad')
macdonalds.reviews.create(rating:2, thoughts:'so so ')
macdonalds.reviews.create(rating:3, thoughts:'too fried')
macdonalds.reviews.create(rating:4, thoughts:'bad')
macdonalds.reviews.create(rating:5, thoughts:'great')
macdonalds.reviews.create(rating:3, thoughts:'bad')


gola = Restaurant.create(name: 'Gola´s', description: 'Italian Food', cuisine: 'Mediterranean'  )
gola.reviews.create(rating:1, thoughts:'bad')
gola.reviews.create(rating:2, thoughts:'so so ')
gola.reviews.create(rating:3, thoughts:'too fried')
gola.reviews.create(rating:4, thoughts:'bad')
gola.reviews.create(rating:5, thoughts:'great')
gola.reviews.create(rating:3, thoughts:'')

