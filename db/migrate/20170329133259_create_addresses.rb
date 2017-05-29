class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses, id: :uuid do |t|
      t.belongs_to :client, foreign_key: true, type: :uuid
      t.belongs_to :barangay, foreign_key: true, type: :uuid
      t.belongs_to :municipality, foreign_key: true, type: :uuid
      t.belongs_to :sitio, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
