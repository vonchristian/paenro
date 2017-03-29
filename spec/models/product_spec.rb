require 'rails_helper'

describe Product do
  describe 'associations' do
    it { is_expected.to belong_to :category }
    it { is_expected.to have_many :stocks }
  end

  describe 'validations' do
    it{ is_expected.to validate_presence_of :name }
    it{ is_expected.to validate_presence_of :unit }
    it{ is_expected.to validate_presence_of :category }
  end
end
