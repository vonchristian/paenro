require 'rails_helper'

feature 'Edit program location' do
  before(:each) do
    user = create(:user)
    login_as(user, scope: :user)

    program_location = create(:program_location)
    visit settings_url
    click_link 'Update'
  end
  scenario 'with valid attributes' do
    fill_in 'Target area', with: 10
    fill_in 'Beneficiary count', with: 20
    click_button 'Update Location'

    expect(page).to have_content('saved successfully')
  end
  scenario 'with invalid attributes' do
    click_button 'Update Location'

    expect(page).to have_content("can't be blank")
  end
end
