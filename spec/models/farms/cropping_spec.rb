require 'rails_helper'

describe Farms::Cropping do
  describe 'associations' do
    it { is_expected.to belong_to :crop }
    it { is_expected.to belong_to :farm }
    it { is_expected.to have_many :harvests }
  end
end
