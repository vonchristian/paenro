require 'rails_helper'

feature 'Create Sitio' do
  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    municipality = create(:municipality)
    barangay = create(:barangay, municipality: municipality)
    visit settings_path
    click_link municipality.name
    click_link barangay.name
    click_link 'New Sitio'
  end
  scenario 'with valid attributes' do
    fill_in 'Name', with: "Tukucan"
    click_button 'Create Sitio'

    expect(page).to have_content('created successfully')
  end
  scenario 'with invalid attributes' do
    click_button 'Create Sitio'

    expect(page).to have_content("can't be blank")
  end
end
