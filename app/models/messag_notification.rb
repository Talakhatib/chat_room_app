class MessagNotification < ApplicationRecord
  belongs_to :user
  belongs_to :message
  belongs_to :room
  # Ex:- scope :active, -> {where(:active => true)}
  after_create_commit {
    broadcast_append_to('messag_notifications',locals: {current_user: self.user,room: self.room})
  }
end
