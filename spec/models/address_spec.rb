require 'rails_helper'

describe Address do
  describe 'associations' do
    it { is_expected.to belong_to :client }
    it { is_expected.to belong_to :sitio }
    it { is_expected.to belong_to :barangay }
    it { is_expected.to belong_to :municipality }
  end
end
