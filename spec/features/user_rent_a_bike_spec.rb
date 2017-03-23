require 'rails_helper'

feature 'User rents a bike' do
  scenario 'successfully' do
    bike = create(:bike)
    advertisement = create(:advertisement, bike: bike, price: 10)
    customer = build(:customer)
    rent = build(:rent, customer: customer, payment: 'Dinheiro', rent_date:'29/04/17')

    visit advertisement_path(advertisement)

    click_on 'Alugar Bike'

    fill_in 'Nome',             with: customer.name
    fill_in 'Telefone',         with: customer.phone
    fill_in 'CPF',              with: customer.cpf
    fill_in 'E-mail',           with: customer.email
    fill_in 'Pagamento',        with: rent.payment
    fill_in 'Data do Aluguel',  with: rent.rent_date


    click_on 'Confirmar Aluguel'

    expect(page).to have_content('Aluguel Confirmado por')
    expect(page).to have_content rent.payment
    expect(page).to have_content rent.rent_date
    expect(page).to have_content customer.name
    expect(page).to have_content customer.phone
    expect(page).to have_content customer.cpf
    expect(page).to have_content customer.email
  end
end
