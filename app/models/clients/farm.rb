module Clients
  class Farm < ApplicationRecord
    belongs_to :client

    validates :area, presence: true, numericality: true
  end
end
