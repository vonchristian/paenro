require 'rails_helper'

RSpec.describe Program, type: :model do
  describe 'associations' do
    it { is_expected.to have_many :beneficiaries }
    it { is_expected.to have_many :program_locations }
    it { is_expected.to have_many :barangays }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
  end
end
