require 'rails_helper'

module Addresses
  describe Sitio do
    describe 'associations' do
      it { is_expected.to belong_to :barangay }
    end
    describe 'validations' do
      it { is_expected.to validate_presence_of :name }
      it { is_expected.to validate_uniqueness_of(:name).scoped_to(:barangay_id)}
    end
  end
end
