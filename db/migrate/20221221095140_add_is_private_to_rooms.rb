class AddIsPrivateToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :is_private, :boolean, :default => false
    #Ex:- :default =>''
  end
end
