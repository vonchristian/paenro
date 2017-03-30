class AddClientToOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :client, foreign_key: true, type: :uuid
  end
end
