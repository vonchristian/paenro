class CreatePrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :programs, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
    add_index :programs, :name, unique: true
  end
end
