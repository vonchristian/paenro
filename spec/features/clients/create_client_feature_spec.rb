require 'rails_helper'

feature 'Create client' do
  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit clients_path
    click_link "New Client"


  end
  scenario 'with valid attributes' do
    municipality = create(:municipality, name: 'Tinoc')

    barangay = create(:barangay, name: 'Tukucan', municipality: municipality)

    sitio = create(:sitio, name: 'Ababba', barangay: barangay)
    program = create(:program, name: "Native Pigs")

    fill_in 'First name', with: 'Von'
    fill_in 'Middle name', with: 'Christian'
    fill_in 'Last name', with: 'Halip'
    fill_in 'Contact number', with: '1111111111'
    choose 'Male'
    select 'Ababba', from: 'client_address_sitio_id'
    select 'Tukucan', from: 'client_addresses_attributes_0_barangay_id'
    select 'Tinoc', from: 'client_addresses_attributes_0_municipality_id'
    choose 'Native Pigs'
    click_button 'Save Client'

    expect(page).to have_content('saved successfully')
  end
  scenario 'with invalid attributes' do
    click_button 'Save Client'

    expect(page).to have_content("can't be blank")
  end
end
