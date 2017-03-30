module Farms
  class Cropping < ApplicationRecord
    belongs_to :crop
    belongs_to :farm, class_name: "Clients::Farm"
    has_many :harvests, class_name: "Farms::Harvest"
    delegate :name, to: :crop, allow_nil: true
  end
end
