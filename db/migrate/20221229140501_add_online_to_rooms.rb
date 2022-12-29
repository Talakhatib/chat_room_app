class AddOnlineToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :online, :string
  end
end
