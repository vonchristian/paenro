require 'rails_helper'

describe Client, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :middle_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :contact_number }
  end

  describe 'enums' do
    it { is_expected.to define_enum_for(:sex).with([:male, :female])}
  end
end
