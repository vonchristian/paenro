class Cart < ApplicationRecord
  has_many :line_items, class_name: "Orders::LineItem"
  has_many :stocks, through: :line_items, class_name: "Products::Stock"
  def add_line_item(line_item)
    if self.stocks.include?(line_item.stock)
      self.line_items.where(stock_id: line_item.stock.id).delete_all
      self.line_items.create(stock_id: line_item.stock.id, quantity: line_item.quantity)
    else
      self.line_items.create(stock_id: line_item.stock.id, quantity: line_item.quantity)
    end
  end
end
