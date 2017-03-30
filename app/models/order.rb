class Order < ApplicationRecord
  belongs_to :user
  belongs_to :client
  has_many :line_items, class_name: "Orders::LineItem"

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
