module Addresses
  class Barangay < ApplicationRecord
    belongs_to :municipality
    has_many :addresses
    has_many :clients, through: :addresses
    has_many :sitios, class_name: "Addresses::Sitio"

    validates :name, presence: true, uniqueness: { scope: :municipality_id }

    delegate :name, to: :municipality, prefix: true

  end
end
