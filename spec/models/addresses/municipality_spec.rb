require 'rails_helper'

module Addresses
  describe Municipality do
    describe 'associations' do
      it { is_expected.to have_many :barangays }
      it { is_expected.to have_many :sitios }
    end
    describe 'validations' do
      it { is_expected.to validate_presence_of :name }
      it { is_expected.to validate_uniqueness_of :name }
    end
  end
end
