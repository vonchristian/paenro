module Clients
  class Farm < ApplicationRecord
    include PgSearch
    pg_search_scope :text_search, :against => [:name]
    belongs_to :client
    has_many :harvests, class_name: "Clients::Harvest"

    validates :area, presence: true, numericality: true
    before_commit :set_name #used for pg_search_scope
    private
    def set_name
      self.name ||= self.client.full_name
    end
  end
end
