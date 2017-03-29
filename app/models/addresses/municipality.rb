module Addresses
  class Municipality < ApplicationRecord
    has_many :barangays
    has_many :sitios, through: :barangays
    validates :name, presence: true, uniqueness: true
  end
end
