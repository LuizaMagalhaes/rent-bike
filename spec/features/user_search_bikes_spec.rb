require "rails_helper"

feature 'User Search For Bicicles' do
  scenario 'successfully' do
    bike = create(:bike, color: 'azul')
    advertisement = create(:advertisement, bike: bike)

    visit root_path

    expect(page).to have_content(advertisement.title)
    expect(page).to have_content(advertisement.address)
    expect(page).to have_content(advertisement.bike.use_for)
    expect(page).to have_content(advertisement.bike.category)

  end
end
