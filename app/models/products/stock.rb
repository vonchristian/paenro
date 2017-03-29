module Products
  class Stock < ApplicationRecord
    belongs_to :product

    validates :quantity, presence: true, numericality: { greater_than: 0.1 }
  end
end
