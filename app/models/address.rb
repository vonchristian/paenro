class Address < ApplicationRecord
  belongs_to :client
  belongs_to :barangay, class_name: "Addresses::Barangay"
  belongs_to :municipality, class_name: "Addresses::Municipality"

  delegate :name, to: :barangay, prefix: true
  delegate :name, to: :municipality, prefix: true

  validates :sitio, presence: true

  def details
    "#{sitio}, #{barangay_name}, #{municipality_name}"
  end
end
