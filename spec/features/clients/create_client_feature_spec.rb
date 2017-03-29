require 'rails_helper'

feature 'Create client' do
  before(:each) do
    visit clients_path
    click_link "New Client"
    
  end
  scenario 'with valid attributes' do
    fill_in 'First name', with: 'Von'
    fill_in 'Middle name', with: 'Christian'
    fill_in 'Last name', with: 'Halip'
    fill_in 'Contact number', with: '1111111111'
    choose 'Male'
    click_button 'Save Client'

    expect(page).to have_content('saved successfully')
  end
  scenario 'with invalid attributes' do
    click_button 'Save Client'

    expect(page).to have_content("can't be blank")
  end
end
