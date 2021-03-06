class Program < ApplicationRecord
  has_many :beneficiaries, class_name: "Client"
  has_many :program_locations, class_name: "Programs::ProgramLocation"
  has_many :barangays, through: :program_locations
  has_many :orders, through: :beneficiaries
  has_many :farms, through: :beneficiaries
  has_many :program_grants, class_name: "Programs::ProgramGrant"

  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :program_locations
  def self.target_area
    all.to_a.sum(&:target_area)
  end

  def target_area
    program_locations.total_target_area
  end
  def actual_area
    farms.total_area
  end
  def target_beneficiaries
    program_locations.total_target_beneficiaries
  end
  def actual_beneficiaries
    beneficiaries.count
  end
  def target_percentage
    if !actual_beneficiaries.zero? && !target_beneficiaries.zero?
      ((actual_beneficiaries / target_beneficiaries )  * 100).to_f
    else
      0
    end
  end
  def available_slots
    target_beneficiaries - beneficiaries.count
  end

end
