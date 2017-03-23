require 'rails_helper'

feature 'User rents a bike' do
  scenario 'successfully' do
    bike = create(:bike)
    advertisement = create(:advertisement, bike: bike)
    customer = build(:customer)
    rent = build(:rent, customer: customer)

    visit advertisement_path(advertisement)

    click_on 'Alugar Bike'

    fill_in 'Nome',       with: customer.name
    fill_in 'Telefone',   with: customer.phone
    fill_in 'CPF',        with: customer.cpf
    fill_in 'Pagamento',  with: customer.payment
    fill_in 'E-mail',     with: customer.email

    click_on 'Confirmar Aluguel'

    expect(page).to have_content('Aluguel Confirmado')
    expect(page).to have_content customer.name
    expect(page).to have_content customer.phone
    expect(page).to have_content customer.cpf
    expect(page).to have_content customer.payment
    expect(page).to have_content customer.email
  end
end
