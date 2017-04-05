require 'rails_helper'

feature 'User do a preview before checkout' do
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

    click_on 'Alugar'

    fill_in 'Pagamento',        with: 'Dinheiro'
    fill_in 'Data do Aluguel',  with: '01/01/2017'

    click_on 'Alugar Bike'

    expect(page).to have_content 'Dinheiro'
    expect(page).to have_content '01/01/2017'
    expect(page).to have_content customer.name
    expect(page).to have_content customer.phone
    expect(page).to have_content customer.cpf
    expect(page).to have_content customer.email
    expect(page).to have_content(advertisement.title)
    expect(page).to have_content(advertisement.address)
    expect(page).to have_content(advertisement.bike.use_for)
    expect(page).to have_content(advertisement.owner)
    expect(page).to have_content(advertisement.phone)

    click_on "Confirmar aluguel"

    expect(page).to have_content "Aluguel Confirmado"
  end
end
