require 'rails_helper'

describe Client, type: :model do
  describe 'associations' do
    it { is_expected.to have_many :addresses }
    it { is_expected.to have_many :orders }
    it { is_expected.to have_many :farms }
    it { is_expected.to have_many :client_requirements }

  end
  describe 'validations' do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :middle_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :contact_number }
  end

  describe 'enums' do
    it { is_expected.to define_enum_for(:sex).with([:male, :female])}
  end
  describe 'nested attributes' do
    it { is_expected.to accept_nested_attributes_for :addresses }
  end
end
