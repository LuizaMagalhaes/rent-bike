require 'rails_helper'

feature 'User views available dates' do
  scenario 'successfully' do
    bike = create(:bike)
    advertisement = create(:advertisement, bike: bike)


    travel_to Date.new(2017,3,24) do
      visit advertisement_path(advertisement)

      expect(page).to have_content '30/03/2017'
      expect(page).to have_content '29/03/2017'
      expect(page).to have_content '28/03/2017'
      expect(page).to have_content '27/03/2017'
      expect(page).to have_content '26/03/2017'
      expect(page).to have_content '25/03/2017'
      expect(page).to have_content '24/03/2017'
    end
  end

  scenario 'when the bike is rented the available dates change'do
    Timecop.freeze(Time.local(2017, 3, 24)) do

      bike = create(:bike)
      customer = create(:customer)
      advertisement = create(:advertisement, bike: bike)
      rent = create(:rent, advertisement: advertisement, customer: customer,
                    rent_date: '27/03/2017')

      visit advertisement_path(advertisement)

      expect(page).to have_content '30/03/2017'
      expect(page).to have_content '29/03/2017'
      expect(page).to have_content '28/03/2017'
      expect(page).not_to have_content '27/03/2017'
      expect(page).to have_content '26/03/2017'
      expect(page).to have_content '25/03/2017'
      expect(page).to have_content '24/03/2017'
    end
  end
end
