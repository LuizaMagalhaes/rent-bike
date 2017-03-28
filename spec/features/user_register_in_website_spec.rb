require 'rails_helper'

feature 'User register in website' do
    scenario 'login' do
      bike = create(:bike)
      customer = create(:customer)
      advertisement = create(:advertisement, bike: bike)

      visit advertisement_path(advertisement)
      click_on 'Alugar Bike'

      fill_in 'Email', with: customer.email
      fill_in 'Senha', with: customer.password

      click_on 'Entrar'

      expect(page).to have_content "Olá, #{customer.name}"
      expect(current_path).to eq new_advertisement_rent_path(advertisement)
    end

    scenario 'logout' do
        customer = create(:customer)

        login_as(customer)
        visit root_path
        click_on 'Logout'

        expect(page).to have_link('Login')
    end

    scenario 'user create new account' do
      customer = build(:customer)

      visit root_path
      click_on 'Login'
      click_on 'Sign up'

      fill_in 'Email',              with: customer.email
      fill_in 'Senha',              with: customer.password
      fill_in 'Confirme sua senha', with: customer.password
      fill_in 'Nome',               with: customer.name
      fill_in 'CPF',                with: customer.cpf
      fill_in 'Telefone',           with: customer.phone

      click_on 'Cadastrar'

      expect(page).to have_content "Olá, #{customer.name}"
      expect(current_path).to eq root_path

    end
>>>>>>> devise
end
