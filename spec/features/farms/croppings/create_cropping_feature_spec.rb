require 'rails_helper'

feature 'Create cropping' do
  before(:each) do
    user = create(:user)
    login_as(user, :scope => :user)

    farm = create(:farm)
    crop = create(:crop, name: "Cabbage")
    visit farm_path(farm)
    click_link 'New Crop'
  end
  scenario 'with valid attributes' do
    choose 'Cabbage'
    click_button "Save Crop"

    expect(page).to have_content("saved successfully")
  end
end
