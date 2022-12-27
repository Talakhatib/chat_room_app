class User < ApplicationRecord

    validates :username, presence: true, uniqueness: :true
    scope :all_except, ->(user) { where.not(id: user) }
    after_create_commit { broadcast_append_to "users" }

    has_many :messages
    has_many :messag_notifications
    
end
