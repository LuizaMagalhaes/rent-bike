require 'rails_helper'

feature 'User rents a bike' do
  scenario 'successfully' do
    bike = create(:bike)
    advertisement = create(:advertisement, bike: bike)
    customer = create(:customer)

    visit root_path

    click_on 'Login'

    fill_in 'Email', with: customer.email
    fill_in 'Senha', with: customer.password

    click_on 'Entrar'

    click_on advertisement.title

    click_on 'Alugar Bike'

    fill_in 'Pagamento',        with: 'Dinheiro'
    fill_in 'Data do Aluguel',  with: '01/01/2017'

    click_on 'Confirmar Aluguel'

    expect(page).to have_content('Aluguel Confirmado por')
    expect(page).to have_content 'Dinheiro'
    expect(page).to have_content '01/01/2017'
    expect(page).to have_content customer.name
    expect(page).to have_content customer.phone
    expect(page).to have_content customer.cpf
    expect(page).to have_content customer.email
  end

  scenario 'bike already rented' do

    bike = create(:bike)
    customer = create(:customer)
    another_customer = create(:customer, name: 'Joao', phone: '999888777',
                              cpf: '987654311', email:'joao@gmail.com')
    ad = create(:advertisement, bike: bike)
    rent = create(:rent, advertisement: ad, customer: customer,
                  rent_date: '20/04/2017')
    login_as(customer)              
    visit root_path
    click_on ad.title
    click_on 'Alugar Bike'

    fill_in 'Pagamento',        with: 'Dinheiro'
    fill_in 'Data do Aluguel',  with: '20/04/2017'

    click_on 'Confirmar Aluguel'

    expect(page).to have_content 'Ops... Essa bike já está alugada no dia 20/04/2017 :('
  end
end
