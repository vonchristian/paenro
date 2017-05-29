class CreateProgramGrants < ActiveRecord::Migration[5.1]
  def change
    create_table :program_grants, id: :uuid do |t|
      t.belongs_to :product, foreign_key: true, type: :uuid
      t.belongs_to :program, foreign_key: true, type: :uuid
      t.decimal :quantity, default: 1

      t.timestamps
    end
  end
end
