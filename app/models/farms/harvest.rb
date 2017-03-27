module Farms
  class Harvest < ApplicationRecord
    belongs_to :farm, class_name: "Clients::Farm"
    validates :weight, :harvest_start_date, :harvest_end_date, :gross_income, presence: true
    validates :weight, :gross_income, numericality: { greater_than: 0.1 }
  end
end
