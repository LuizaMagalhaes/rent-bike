require 'rails_helper'

feature 'User views available dates' do
  scenario 'successfully' do
    bike = create(:bike)
    advertisement = create(:advertisement, bike: bike)


    travel_to Date.new(2017,3,24) do
      visit advertisement_path(advertisement)

      expect(page).to have_content '24 25 26 27 28 29 30 /3/2017'
    end

  end
end
