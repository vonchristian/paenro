require 'rails_helper'

module Products
describe Stock do
  describe 'associations' do
    it { is_expected.to belong_to :product }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :quantity }
    it { is_expected.to validate_presence_of :date }
    it { is_expected.to validate_numericality_of :quantity }
  end
end
