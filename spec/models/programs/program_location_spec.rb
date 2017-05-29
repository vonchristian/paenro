require 'rails_helper'
module Programs
  describe ProgramLocation do
    describe 'associations' do
      it { is_expected.to belong_to :program }
      it { is_expected.to belong_to :barangay }
    end
    describe 'validations' do
      it { is_expected.to validate_presence_of :beneficiary_count }
      it { is_expected.to validate_numericality_of :beneficiary_count }
      it { is_expected.to validate_presence_of :target_area }
      it { is_expected.to validate_numericality_of :target_area }
    end
  end
end
