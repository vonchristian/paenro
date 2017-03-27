require 'rails_helper'

feature 'Create program grant' do
  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit settings_path

    program = create(:program)
    visit settings_url
    click_link 'Add Grant'
    expect(current_path).to eql(new_settings_program_program_grant_path(program))
  end
  scenario 'with valid attributes' do
    product = create(:product)
    fill_in 'Quantity', with: 1
    click_button 'Add'

    expect(page).to have_content("added successfully")
    expect(program.program_grants).to eql(1)
  end
  scenario 'with invalid attributes' do
    click_button 'Add'

    expect(page).to have_content("can't be blank")
  end
end
