class CreateRequirements < ActiveRecord::Migration[5.1]
  def change
    create_table :requirements, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
    add_index :requirements, :name, unique: true
  end
end
