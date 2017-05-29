require 'rails_helper'

describe Address do
  describe 'associations' do
    it { is_expected.to belong_to :client }
    it { is_expected.to belong_to :barangay }
    it { is_expected.to belong_to :municipality }
  end
  describe 'validations' do
    it { is_expected.to validate_presence_of :sitio }
  end
  it '#detais' do
    municipality = create(:municipality, name: "Tinoc")
    barangay = create(:barangay, name: "Tukucan", municipality: municipality)
    address = build(:address, sitio: 'Ababba', barangay: barangay, municipality: municipality)
    
    expect(address.details).to eql("Ababba, Tukucan, Tinoc")
  end
end
