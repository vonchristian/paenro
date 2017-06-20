module Programs
  class ProgramGrant < ApplicationRecord
    belongs_to :program
    belongs_to :product

    validates :product, :quantity, presence: true
    validates :quantity, numericality: { greater_than: 0.1 }
    validates :product_id, uniqueness: { scope: :program_id }
    delegate :name, to: :product, prefix: true, allow_nil: true
    def self.already_include?(product)
      all.where(product: product).present?
    end
  end
end
