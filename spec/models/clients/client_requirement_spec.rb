require 'rails_helper'

module Clients
  describe ClientRequirement  do
    describe 'associations' do
      it {is_expected.to belong_to :requirement }
      it { is_expected.to belong_to :client }
    end
  end
end
