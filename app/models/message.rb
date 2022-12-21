class Message < ApplicationRecord
  belongs_to :user,dependent: :destroy
  belongs_to :room, dependent: :destroy
  
  validates :content, presence: true

  after_create_commit { broadcast_append_to self.room }
  has_noticed_notifications
  after_create_commit :notify_user

  def notify_user
    users = User.all_except(self.user)
    users.each do |user|
      MessageNotification.with(message: self).deliver_later(user)
    end
  end

end
