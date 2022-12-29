class RemoveOnlineFromRooms < ActiveRecord::Migration[7.0]
  def change
    remove_column :rooms, :online, :string
  end
end
