module Addresses
  class Sitio < ApplicationRecord
    belongs_to :barangay
    validates :name, presence: true, uniqueness: { scope: :barangay_id }

  end
end
