class Message < ApplicationRecord
  belongs_to :user,dependent: :destroy
  belongs_to :room, dependent: :destroy
  
  validates :content, presence: true
  
  after_create_commit { broadcast_append_to(self.room,locals: {current_user: self.user}) }
  has_many :messag_notifications
  after_create_commit :notify_user
  
  def notify_user
    users = User.where.not(id: self.user.id)
    users.each do |user|
      MessagNotification.create(user: user,room: self.room,message: self )
    end
  end

end
