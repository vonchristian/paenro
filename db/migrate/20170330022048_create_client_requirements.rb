class CreateClientRequirements < ActiveRecord::Migration[5.1]
  def change
    create_table :client_requirements, id: :uuid do |t|
      t.belongs_to :client, foreign_key: true, type: :uuid
      t.belongs_to :requirement, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
