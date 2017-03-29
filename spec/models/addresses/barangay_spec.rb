require 'rails_helper'

module Addresses
  describe Barangay do
    describe 'associations' do
      it { is_expected.to belong_to :municipality }
      it { is_expected.to have_many :sitios }
    end
    describe 'validations' do
      it { is_expected.to validate_presence_of :name }
      it { is_expected.to validate_uniqueness_of(:name).scoped_to(:municipality_id)}
    end
  end
end
