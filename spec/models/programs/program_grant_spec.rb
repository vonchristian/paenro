require 'rails_helper'

module Programs
  RSpec.describe ProgramGrant do
    describe 'associations' do
      it { is_expected.to belong_to :product }
      it { is_expected.to belong_to :program }
    end

    describe 'validations' do
      it { is_expected.to validate_presence_of :product }
      it { is_expected.to validate_presence_of :quantity }
      it { is_expected.to validate_numericality_of :quantity }
    end
    describe 'delegations' do
      it { is_expected.to delegate_method(:name).to(:product).with_prefix }
    end
  end
end
