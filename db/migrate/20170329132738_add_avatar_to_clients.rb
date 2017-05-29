class AddAvatarToClients < ActiveRecord::Migration[5.1]
def up
    add_attachment :clients, :avatar
  end

  def down
    remove_attachment :clients, :avatar
  end
end
