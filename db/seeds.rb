# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

bike = Bike.create([{color: 'azul', weel_size: 'aro 26', condition: 'nova',
  category: 'adulto', use_for:'passeio'}])
Advertisement.create(title: 'bicicleta de passeio', price: 14.9, 
    address:'rua pamplona, 345', owner: 'Alan Baptista',
    phone: '93849843', bike: bike.first)
