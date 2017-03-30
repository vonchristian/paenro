require 'rails_helper'

module Clients
  describe Farm do
    describe 'associations' do
      it { is_expected.to belong_to :client }
    end
    describe 'validations' do
      it { is_expected.to validate_presence_of :area }
      it { is_expected.to validate_numericality_of :area }
    end
  end 
end
