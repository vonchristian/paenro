require 'rails_helper'

feature 'Create client' do
  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit clients_path
    click_link "New Client"

    municipality = create(:municipality, name: 'Ifugao')
    barangay = create(:barangay, name: 'Tinoc', municipality: municipality)

    sitio = create(:sitio, name: 'Tukucan', barangay: barangay)

  end
  scenario 'with valid attributes' do
    fill_in 'First name', with: 'Von'
    fill_in 'Middle name', with: 'Christian'
    fill_in 'Last name', with: 'Halip'
    fill_in 'Contact number', with: '1111111111'
    choose 'Male'
    select 'Tukucan', from: 'client_addresses_attributes_0_sitio_id'
    select 'Tinoc', from: 'client_addresses_attributes_0_barangay_id'
    select 'Ifugao', from: 'client_addresses_attributes_0_municipality_id'
    click_button 'Save Client'

    expect(page).to have_content('saved successfully')
  end
  scenario 'with invalid attributes' do
    click_button 'Save Client'

    expect(page).to have_content("can't be blank")
  end
end
