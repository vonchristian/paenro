class AddProgramIdToClients < ActiveRecord::Migration[5.1]
  def change
    add_reference :clients, :program, foreign_key: true, type: :uuid
  end
end
