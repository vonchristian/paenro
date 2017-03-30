require 'rails_helper'

feature 'Create stock' do
  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    client = create(:client)
    visit client_path(client)
    click_link 'New Farm'
  end

  scenario 'with valid attributes' do
    fill_in "Area", with: 100
    check 'Suitable'
    check 'Cleared'

    click_button 'Save Farm'

    expect(page).to have_content('saved successfully')
  end
  scenario 'with invalid attributes' do
    click_button 'Save Farm'

    expect(page).to have_content("can't be blank")
  end
end
