class AddUnitCostAndTotalCostToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :unit_cost, :decimal
    add_column :stocks, :total_cost, :decimal
  end
end
