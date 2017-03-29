# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
customer = Customer.create({name: 'Claudia', phone: '11978574673', cpf: '350.756.948-05',
                            email: 'claudia@gmail.com', password: '123456'})

bike = Bike.create({color: 'Azul', weel_size: 'aro 26', condition: 'Nova',
                    category: 'Adulto', use_for:'Passeio',
                    photo_url: 'http://www.caloi.com/userfiles/bikes/fotos/t1_arquivo_20150611145843.jpg'})

bike2 = Bike.create({color: 'Vermelha', weel_size: 'aro 26', condition: 'Semi-nova',
                      category: 'Adulto', use_for:'Corrida',
                      photo_url: 'http://www.livresportes.com.br/images/livresportes/foto_texto_fd76eeb2657fb6eb2951b4de585489bf.jpeg'})


ad = Advertisement.create(title: 'Bicicleta de Passeio', price: 14.9,
                    address:'rua pamplona, 345', owner: 'Alan Baptista',
                    phone: '93849843', bike: bike)

Advertisement.create(title: 'Bicicleta de Corrida', price: 16.9,
                    address:'Av Jabaquara, 270', owner: 'Fernanda Lima',
                    phone: '93434567', bike: bike2)

Rent.create(customer: customer, advertisement: ad,
                  payment: 'Dinheiro', rent_date: '03/04/2017', price: ad.price)
