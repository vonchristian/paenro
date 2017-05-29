class CreateFarms < ActiveRecord::Migration[5.1]
  def change
    create_table :farms, id: :uuid do |t|
      t.belongs_to :client, foreign_key: true, type: :uuid
      t.decimal :area
      t.boolean :suitable, default: false
      t.boolean :cleared, default: false

      t.timestamps
    end
  end
end
