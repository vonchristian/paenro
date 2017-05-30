module Orders
  class LineItem < ApplicationRecord
    belongs_to :order, optional: true
    belongs_to :stock, class_name: "Products::Stock"
    belongs_to :cart

    delegate :name, to: :stock, prefix: true, allow_nil: true
    delegate :unit, to: :stock
    delegate :date, :client_full_name, to: :order, allow_nil: true
    before_save :set_total_cost
    def self.total
      all.sum(&:total_cost)
    end
    private
    def set_total_cost
      self.total_cost = self.quantity * self.unit_cost
    end
  end
end
