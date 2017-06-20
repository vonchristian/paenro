class AddSitioToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :sitio, :string
  end
end
