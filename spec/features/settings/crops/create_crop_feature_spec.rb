require 'rails_helper'

feature 'Create crop' do
  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit settings_path
    click_link "New Crop"
  end

  scenario 'with valid attributes' do
    fill_in 'Name', with: "Squash"
    click_button 'Create Crop'

    expect(page).to have_content('created successfully')
  end
  scenario 'with invalid attributes' do
    click_button 'Create Crop'

    expect(page).to have_content("can't be blank")
  end
end
