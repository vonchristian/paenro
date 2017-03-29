module Addresses
  class Barangay < ApplicationRecord
    belongs_to :municipality
    has_many :sitios

    validates :name, presence: true, uniqueness: { scope: :municipality_id }

  end
end
