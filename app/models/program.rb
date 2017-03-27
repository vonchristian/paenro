class Program < ApplicationRecord
  has_many :beneficiaries, class_name: "Client"
  has_many :program_locations, class_name: "Programs::ProgramLocation"
  has_many :barangays, through: :program_locations
  has_many :orders, through: :beneficiaries

  validates :name, presence: true, uniqueness: true

end
