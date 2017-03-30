class AddHarvestedToFarms < ActiveRecord::Migration[5.1]
  def change
    add_column :farms, :harvested, :boolean, default: false
  end
end
