class Product < ApplicationRecord
  include PgSearch
  pg_search_scope :text_search, :against => [:name, :description]
  belongs_to :category
  has_many :stocks, class_name: "Products::Stock"

  validates :name, :category, :unit, presence: true

  def self.by_category(category)
    all.where(category: category)
  end
  def quantity
    stocks.sum(:quantity)
  end
  def in_stock

  end
  def claimed
  end
end
