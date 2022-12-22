class Room < ApplicationRecord

    validates_uniqueness_of :name
    validates :name, presence: true
    scope :public_rooms, -> { where(is_private: false) }
    after_create_commit {broadcast_append_to "rooms"}
    has_many :messages
    has_noticed_notifications model_name: 'Notification'
end
