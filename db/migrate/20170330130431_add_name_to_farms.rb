class AddNameToFarms < ActiveRecord::Migration[5.1]
  def change
    add_column :farms, :name, :string
  end
end
