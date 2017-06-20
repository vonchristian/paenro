module Products
  class Stock < ApplicationRecord
    include PgSearch
    pg_search_scope :text_search, :against => [:name, :description]
    belongs_to :product
    has_many :line_items, class_name: "Orders::LineItem"

    validates :quantity, :unit_cost, :total_cost, presence: true, numericality: { greater_than: 0.1 }
    validates :date, presence: true
    delegate :unit, to: :product
    before_commit :set_name, :set_description
    def in_stock
      quantity - line_items.sum(:quantity)
    end

    private
    def set_name
      self.name ||= self.product.name
    end
    def set_description
      self.description ||= self.product.description
    end
  end
end
