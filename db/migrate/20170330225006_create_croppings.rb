class CreateCroppings < ActiveRecord::Migration[5.1]
  def change
    create_table :croppings, id: :uuid do |t|
      t.belongs_to :product, foreign_key: true, type: :uuid
      t.belongs_to :farm, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
