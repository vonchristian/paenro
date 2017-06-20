class CreateLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :line_items, id: :uuid do |t|
      t.belongs_to :order, foreign_key: true, type: :uuid
      t.belongs_to :stock, foreign_key: true, type: :uuid
      t.belongs_to :cart, foreign_key: true, type: :uuid
      t.decimal :quantity

      t.timestamps
    end
  end
end
