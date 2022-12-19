class Room < ApplicationRecord

    belongs_to :user, dependent: :destroy
    validates :name, presence: true

    has_many :messages
end
