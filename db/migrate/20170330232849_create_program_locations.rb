class CreateProgramLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :program_locations, id: :uuid do |t|
      t.belongs_to :barangay, foreign_key: true, type: :uuid
      t.belongs_to :program, foreign_key: true, type: :uuid
      t.decimal :target_area
      t.decimal :beneficiary_count
      t.timestamps
    end
  end
end
