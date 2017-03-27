require 'rails_helper'

module Clients
  describe Farm do
    describe 'associations' do
      it { is_expected.to belong_to :client }
      it { is_expected.to have_many :harvests }
    end
    describe 'validations' do
      it { is_expected.to validate_presence_of :area }
      it { is_expected.to validate_numericality_of :area }
    end
    it '.total_area' do
      farm = create(:farm, area: 1)
      farm_2 = create(:farm, area: 6)

      expect(Clients::Farm.total_area).to eql(7)
    end
  end
end
