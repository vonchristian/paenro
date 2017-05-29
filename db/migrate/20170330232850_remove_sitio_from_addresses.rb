class RemoveSitioFromAddresses < ActiveRecord::Migration[5.1]
  def change
    remove_reference :addresses, :sitio, foreign_key: true, type: :uuid
  end
end
