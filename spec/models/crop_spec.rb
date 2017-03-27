require 'rails_helper'

RSpec.describe Crop, type: :model do
  describe 'associations' do
    it { is_expected.to have_many :croppings }
    it { is_expected.to have_many :farms }
  end
  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
  end
end
