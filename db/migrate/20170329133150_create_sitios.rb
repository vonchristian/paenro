class CreateSitios < ActiveRecord::Migration[5.1]
  def change
    create_table :sitios, id: :uuid do |t|
      t.string :name
      t.belongs_to :barangay, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
