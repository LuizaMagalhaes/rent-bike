require 'rails_helper'

feature 'User views your rental history' do
  scenario 'successfully' do
    bike = create(:bike)
    customer = create(:customer)
    advertisement = create(:advertisement, bike: bike)
    rent = create(:rent, advertisement: advertisement, price: 14.9, customer: customer,
                  rent_date: '27/03/2017')
    other_rent = create(:rent, advertisement: advertisement,
                  price: 19.9, customer: customer, rent_date: '29/03/2017')

    login_as(customer)
    visit root_path
    click_on 'Meus alugueis'

    expect(page).to have_content(bike.use_for,          count: 2)
    expect(page).to have_content(advertisement.owner,   count: 2)
    expect(page).to have_content(bike.category,         count: 2)
    expect(page).to have_content(bike.weel_size,        count: 2)
    expect(page).to have_content(rent.rent_date)
    expect(page).to have_content(rent.price)
    expect(page).to have_content(other_rent.rent_date)
    expect(page).to have_content(other_rent.price)

  end

  scenario 'and does not view other customers rents' do
    bike = create(:bike, color: 'Azul')
    customer = create(:customer, name: 'Luiza', email: 'luiza@email.com')
    advertisement = create(:advertisement, bike: bike)
    rent = create(:rent, advertisement: advertisement, price: 14.9,
                  customer: customer, rent_date: '27/03/2017')

    another_bike = create(:bike, color: 'Vermelha')
    another_customer = create(:customer, name: 'Jenyfer', email: 'jeny@email.com')
    another_rent = create(:rent, advertisement: advertisement, price: 13,
                  customer: another_customer, rent_date: '15/02/2017')

    login_as(customer)
    visit root_path
    click_on 'Meus alugueis'

    expect(page).to have_content(bike.use_for)
    expect(page).to have_content(advertisement.owner)
    expect(page).to have_content(bike.category)
    expect(page).to have_content(bike.weel_size)
    expect(page).to have_content(rent.rent_date)
    expect(page).to have_content(rent.price)
    expect(page).not_to have_content another_bike.color
    expect(page).not_to have_content another_rent.rent_date
  end
  scenario 'If there is no rent' do
    bike = create(:bike, color: 'Azul')
    customer = create(:customer, name: 'Luiza', email: 'luiza@email.com')
    advertisement = create(:advertisement, bike: bike)
    rent = create(:rent, advertisement: advertisement, price: 14.9,
                  customer: customer, rent_date: '27/03/2017')


    another_customer = create(:customer, name: 'Jenyfer', email: 'jeny@email.com')

    login_as(another_customer)
    visit root_path
    click_on 'Meus alugueis'

    expect(page).to have_content 'Ops... voce ainda não alugou nenhuma  bike :('

  end
end
