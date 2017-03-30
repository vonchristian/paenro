require 'rails_helper'

module Clients
  describe Harvest do
    describe 'associations' do
      it { is_expected.to belong_to :farm }
    end
    describe 'validations' do
      it { is_expected.to validate_presence_of :weight }
      it { is_expected.to validate_numericality_of :weight }
      it { is_expected.to validate_presence_of :gross_income }
      it { is_expected.to validate_numericality_of :gross_income }
      it { is_expected.to validate_presence_of :date_harvested }
    end
  end
end
