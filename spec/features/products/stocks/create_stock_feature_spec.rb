require 'rails_helper'

feature 'Create stock' do
  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    product = create(:product)
    visit products_path
    click_link "New Stock"
  end

  scenario 'with valid attributes' do


    fill_in "Quantity", with: 100
    fill_in 'Date', with: Date.today

    click_button 'Save Stock'

    expect(page).to have_content('saved successfully')
  end
  scenario 'with invalid attributes' do
    click_button 'Save Stock'

    expect(page).to have_content("can't be blank")
  end
end
