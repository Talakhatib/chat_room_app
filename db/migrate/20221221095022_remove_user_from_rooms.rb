class RemoveUserFromRooms < ActiveRecord::Migration[7.0]
  def change
    remove_reference :rooms, :user, null: false, foreign_key: true
  end
end
