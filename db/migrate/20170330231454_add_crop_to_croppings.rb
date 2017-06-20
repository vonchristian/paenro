class AddCropToCroppings < ActiveRecord::Migration[5.1]
  def change
    add_reference :croppings, :crop, foreign_key: true, type: :uuid
    remove_reference :croppings, :product, foreign_key: true, type: :uuid
  end
end
