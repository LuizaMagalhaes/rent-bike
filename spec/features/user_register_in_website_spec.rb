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

    scenario ''
end
