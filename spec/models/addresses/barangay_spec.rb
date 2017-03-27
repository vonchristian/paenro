require 'rails_helper'

module Addresses
  describe Barangay do
    describe 'associations' do
      it { is_expected.to belong_to :municipality }
    end
    describe 'validations' do
      it { is_expected.to validate_presence_of :name }
      it { is_expected.to validate_uniqueness_of(:name).scoped_to(:municipality_id)}
    end
    describe 'delegations' do
      it { is_expected.to delegate_method(:name).to(:municipality).with(:prefix) }
    end
  end
end
