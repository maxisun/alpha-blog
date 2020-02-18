# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Article.delete_all
User.delete_all

users = [
  [ "Kanna Kamui", "kanna_kamui@gmail.com", "lolis" ]
]

articles = [
  [ "La puta con un culo blanco", "Mafer rivas es una puta que tiene un tremendo culo", 1]
]

users.each do | username, email, password |
  User.create( username: username, email: email, password: password )
end

articles.each do | title, description, user_id |
  Article.create( title: title, description: description, user_id: user_id  )
end