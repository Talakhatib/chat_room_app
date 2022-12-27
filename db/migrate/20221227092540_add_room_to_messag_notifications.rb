class AddRoomToMessagNotifications < ActiveRecord::Migration[7.0]
  def change
    add_reference :messag_notifications, :room, null: false, foreign_key: true
  end
end
