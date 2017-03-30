class AddNameToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :name, :string
    add_column :stocks, :description, :string
  end
end
