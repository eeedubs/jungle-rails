# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

# Let's do this ...

## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Apparel'
cat2 = Category.find_or_create_by! name: 'Electronics'
cat3 = Category.find_or_create_by! name: 'Furniture'

## PRODUCTS

puts "Re-creating Products ..."

Product.destroy_all

cat1.products.create!({
  name:  'Men\'s Classy shirt',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel1.jpg'),
  quantity: 10,
  price: 64.99
})
#id 1

cat1.products.create!({
  name:  'Women\'s Zebra pants',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel2.jpg'),
  quantity: 18,
  price: 124.99
})
#id 2

cat1.products.create!({
  name:  'Hipster Hat',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel3.jpg'),
  quantity: 4,
  price: 34.49
})
#id 3

cat1.products.create!({
  name:  'Hipster Socks',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel4.jpg'),
  quantity: 8,
  price: 25.00
})
#id 4

cat1.products.create!({
  name:  'Russian Spy Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel5.jpg'),
  quantity: 8,
  price: 1_225.00
})
#id 5

cat1.products.create!({
  name:  'Human Feet Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel6.jpg'),
  quantity: 82,
  price: 224.50
})
#id 6

cat2.products.create!({
  name:  'Modern Skateboards',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics1.jpg'),
  quantity: 40,
  price: 164.49
})
#id 7

cat2.products.create!({
  name:  'Hotdog Slicer',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics2.jpg'),
  quantity: 3,
  price: 26.00
})
#id 8

cat2.products.create!({
  name:  'World\'s Largest Smartwatch',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics3.jpg'),
  quantity: 32,
  price: 2_026.29
})
#id 9

cat3.products.create!({
  name:  'Optimal Sleeping Bed',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture1.jpg'),
  quantity: 320,
  price: 3_052.00
})
# id 10

cat3.products.create!({
  name:  'Electric Chair',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture2.jpg'),
  quantity: 0,
  price: 987.65
})
#id 11

cat3.products.create!({
  name:  'Red Bookshelf',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture3.jpg'),
  quantity: 23,
  price: 2_483.75
})
#id 12

User.destroy_all

user1 = User.create({
  name: "Eric Watts",
  email: "erwa@example.com",
  password_digest: "123"
})

user2 = User.create({
  name: "Kevin Adams",
  email: "keva@example.com",
  password_digest: "123"
})

user3 = User.create({
  name: "Janey Miller",
  email: "jmils@example.com",
  password_digest: "123"
})

Rating.destroy_all

rating1 = Rating.create({
  product_id: 1,
  user_id: 1,
  description: "I've made smarter purchases in my life. Wore this to a barn party and it ended up wrapped around my head.",
  rating: 2
})

rating2 = Rating.create({
  product_id: 1,
  user_id: 3,
  description: "Threading is cheap, and I'm a women so I'm not really sure why I bought this. 1 out of 5.",
  rating: 1
})

rating3 = Rating.create({
  product_id: 2,
  user_id: 2,
  description: "Life isn't always black and white, but these pants are. This review makes no sense. 2/5 at best.",
  rating: 5
})

rating4 = Rating.create({
  product_id: 3,
  user_id: 2,
  description: "I was wearing hats like this before they became cool. 5/5 but only because I coined this fashion accessory.",
  rating: 5
})

rating5 = Rating.create({
  product_id: 3,
  user_id: 1,
  description: "Covers my head. 4/4.",
  rating: 4
})

rating6 = Rating.create({
  product_id: 4,
  user_id: 3,
  description: "Wooo, socks. Socks socks socks socks socks socks. I love socks.",
  rating: 5
})

rating7 = Rating.create({
  product_id: 5,
  user_id: 1,
  description: "Nothing says I still live in my parent's basement like buying spy shoes!",
  rating: 1
})

rating8 = Rating.create({
  product_id: 6,
  user_id: 2,
  description: "Disappointed to learn that these were not made with actual human feet.",
  rating: 2
})

rating9 = Rating.create({
  product_id: 7,
  user_id: 2,
  description: "Gets me everywhere I need to go. Beyond that, a completely unnecessary purchase.",
  rating: 3
})

rating10 = Rating.create({
  product_id: 7,
  user_id: 3,
  description: "My skateboard caught on fire and left me permanently disabled. Lawsuit in the works.",
  rating: 1
})

rating11 = Rating.create({
  product_id: 9,
  user_id: 2,
  description: "It's like having an iPad wrapped around your wrist, which some may find massively inconvenient. If your life is a jumbled mess like mine, buy it. 4/5 for sure.",
  rating: 4
})

rating12 = Rating.create({
  product_id: 10,
  user_id: 3,
  description: "I can say without a doubt I've had the worst sleeps ever in this bed.",
  rating: 2
})

rating13 = Rating.create({
  product_id: 11,
  user_id: 3,
  description: "This electric chair is shocking. Hahahaha gosh dang that's a knee slapper if I've ever heard one. 5/5 would recommend",
  rating: 5
})

rating14 = Rating.create({
  product_id: 12,
  user_id: 1,
  description: "It's a bookshelf, it's red, and it's 5 out of 5 stars.",
  rating: 5
})





puts "DONE!"
