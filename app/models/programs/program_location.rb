module Programs
  class ProgramLocation < ApplicationRecord
    belongs_to :barangay, class_name: "Addresses::Barangay", optional: true
    belongs_to :program

    validates :target_area, :beneficiary_count, presence: true, numericality: { greater_than: 0.1 }, on: :update

    delegate :name, to: :barangay, allow_nil: true
    def self.total_target_area
      all.sum(&:target_area)
    end
    def self.total_target_beneficiaries
      all.sum(&:beneficiary_count)
    end
  end
end
