module Orders
  class LineItem < ApplicationRecord
    belongs_to :order, optional: true
    belongs_to :stock, class_name: "Products::Stock"
    belongs_to :cart

    delegate :name, to: :stock, prefix: true, allow_nil: true
    delegate :unit, to: :stock
  end
end