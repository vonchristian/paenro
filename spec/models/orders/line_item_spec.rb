require 'rails_helper'

module Orders
  describe LineItem do
    describe 'associations' do
      it { is_expected.to belong_to :cart }
      it { is_expected.to belong_to :stock }
      it { is_expected.to belong_to :order }
    end
    describe 'validations' do

    end
  end
end
