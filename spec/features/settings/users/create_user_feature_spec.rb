require 'rails_helper'

feature 'Create user' do
  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit settings_path
    click_link "New User"

  end
  scenario 'with valid attributes' do
    fill_in 'First name', with: 'Von'
    fill_in 'Last name', with: 'Halip'
    fill_in 'Email', with: 'vc.halip@gmail.com'
    fill_in 'Password', with: 'secretpassword'
    fill_in 'Password confirmation', with: 'secretpassword'

    click_button 'Save User'

    expect(page).to have_content('registered successfully')
  end
  scenario 'with invalid attributes' do
    click_button 'Save User'

    expect(page).to have_content("can't be blank")
  end
end
