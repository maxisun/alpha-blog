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
  [ "Kanna Kamui", "maxespinal@live.com", "$2a$12$f1x6KfrB4gbq7NCC0R2X.O6QR0b9FlYnzD3bIWefAOvlXOKQa6ErW" ] #=> lolis
]

articles = [
  [ "La puta con un culo blanco", "Mafer rivas es una puta que tiene un tremendo culo" ]
]

users.each do | username, email, password_digest |
  User.create( username: username, email: email, password_digest: password_digest )
end

articles.each do | title, description |
  usuario = User.first
  Article.create( title: title, description: description, user_id: usuario.id  )
end

