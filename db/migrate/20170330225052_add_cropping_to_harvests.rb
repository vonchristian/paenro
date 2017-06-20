class AddCroppingToHarvests < ActiveRecord::Migration[5.1]
  def change
    add_reference :harvests, :cropping, foreign_key: true, type: :uuid
  end
end
