require 'rails_helper'

  feature 'User view bike details' do
    scenario 'successfully' do

      bike = create(:bike)
      advertisement = create(:advertisement, bike: bike)

      visit root_path
      click_on advertisement.title

      expect(current_path).to eq advertisement_path(advertisement)
      expect(page).to have_content(advertisement.title)
      expect(page).to have_content(advertisement.address)
      expect(page).to have_content(advertisement.bike.use_for)
      expect(page).to have_content(advertisement.owner)
      expect(page).to have_content(advertisement.phone)
      expect(page).to have_xpath("//img[contains(@src,'#{bike.photo_url}')]")

  end
end
