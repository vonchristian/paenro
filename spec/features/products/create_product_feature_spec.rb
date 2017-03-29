require 'rails_helper'

feature 'Create product' do
  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit products_path
    click_link "New Product"

    category = create(:category, name: 'Seedlings')
  end

  scenario 'with valid attributes' do


    fill_in 'Name', with: "Carrots (100g)"
    fill_in 'Description', with: 'Carrot seedlings'
    select 'Seedlings', from: 'product_category_id'
    click_button 'Create Product'

    expect(page).to have_content('created successfully')
  end
  scenario 'with invalid attributes' do
    click_button 'Create Product'

    expect(page).to have_content("can't be blank")
  end
end
