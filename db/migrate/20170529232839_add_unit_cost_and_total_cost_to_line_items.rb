class AddUnitCostAndTotalCostToLineItems < ActiveRecord::Migration[5.1]
  def change
    add_column :line_items, :unit_cost, :decimal
    add_column :line_items, :total_cost, :decimal
  end
end
