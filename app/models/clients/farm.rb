module Clients
  class Farm < ApplicationRecord
    include PgSearch
    pg_search_scope :text_search, :against => [:name]
    belongs_to :client
    has_many :harvests, class_name: "Farms::Harvest"
    has_many :croppings, class_name: "Farms::Cropping"
    has_many :crops

    validates :area, presence: true, numericality: true
    before_commit :set_name #used for pg_search_scope
    private
    def set_name
      self.name ||= self.client.full_name
    end
  end
end
