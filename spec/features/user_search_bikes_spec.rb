require "rails_helper"

feature 'User Search For Bicicles' do
  scenario 'successfully' do
    bike = create(:bike, color: 'azul')

    visit root_path


    expect(page).to have_css('h2', text: bike.use_for)
    expect(page).to have_link(bike.use_for)
    expect(page).to have_content(bike.category)

  end
end
