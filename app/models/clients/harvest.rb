module Clients
  class Harvest < ApplicationRecord
    belongs_to :farm, class_name: "Clients::Farm"
    validates :weight, :date_harvested, :gross_income, presence: true
    validates :weight, :gross_income, numericality: { greater_than: 0.1 }
  end
end
