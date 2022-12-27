class CreateMessagNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :messag_notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :message, null: false, foreign_key: true
      t.datetime :read_at

      t.timestamps
    end
  end
end
