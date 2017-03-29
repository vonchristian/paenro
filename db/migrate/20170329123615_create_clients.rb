class CreateClients < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :clients, id: :uuid do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :contact_number
      t.integer :sex, default: 0

      t.timestamps
    end
  end
end
