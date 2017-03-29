class Address < ApplicationRecord
  belongs_to :client
  belongs_to :barangay, class_name: "Addresses::Barangay"
  belongs_to :municipality, class_name: "Addresses::Municipality"
  belongs_to :sitio, class_name: "Addresses::Sitio"

  delegate :name, to: :sitio, prefix: true
  delegate :name, to: :barangay, prefix: true
  delegate :name, to: :municipality, prefix: true

  def details
    "#{sitio_name}, #{barangay_name}, #{municipality_name}"
  end
end
