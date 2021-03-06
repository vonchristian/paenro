require 'rails_helper'

feature "Create harvest" do
  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    farm = create(:farm)
    crop = create(:crop, name: "Cabbage")
    visit farms_path
    click_link "New Harvest"
  end
  scenario 'with valid attributes' do
    fill_in 'Weight', with: 100
    fill_in 'Gross income', with: 12000
    fill_in 'harvest_start_date', with: Date.today
    fill_in 'harvest_end_date', with: Date.today

    click_button "Save Harvest"

    expect(page).to have_content('saved successfully')
  end
  scenario 'with invalid attributes' do
    click_button 'Save Harvest'

    expect(page).to have_content("can't be blank")
  end
end
