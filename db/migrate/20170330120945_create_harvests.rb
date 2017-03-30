class CreateHarvests < ActiveRecord::Migration[5.1]
  def change
    create_table :harvests, id: :uuid do |t|
      t.belongs_to :farm, foreign_key: true, type: :uuid
      t.decimal :weight
      t.decimal :gross_income
      t.datetime :date_harvested

      t.timestamps
    end
  end
end
