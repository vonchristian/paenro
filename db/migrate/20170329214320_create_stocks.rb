class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks, id: :uuid do |t|
      t.belongs_to :product, foreign_key: true, type: :uuid
      t.decimal :quantity
      t.datetime :date

      t.timestamps
    end
  end
end
