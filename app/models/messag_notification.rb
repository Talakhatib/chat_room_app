class MessagNotification < ApplicationRecord
  belongs_to :user
  belongs_to :message
  belongs_to :room
  # Ex:- scope :active, -> {where(:active => true)}
  after_create_commit {
    broadcast_append_to("messag_notifications_#{self.user.username}_#{self.room.id}",locals: {current_user: self.user,room: self.room})
  }
end
